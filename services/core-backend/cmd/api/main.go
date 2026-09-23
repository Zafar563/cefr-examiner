package main

import (
	"context"
	"database/sql"
	"fmt"
	"log"
	"os"
	"time"

	"github.com/gin-contrib/cors"
	"github.com/gin-gonic/gin"
	_ "github.com/lib/pq"
	"github.com/redis/go-redis/v9"

	"cefr-core-backend/internal/auth"
	"cefr-core-backend/internal/handlers"
	"cefr-core-backend/internal/repository"
)

func main() {
	port := os.Getenv("PORT")
	if port == "" {
		port = "8080"
	}

	dbURL := os.Getenv("DATABASE_URL")
	if dbURL == "" {
		dbURL = "postgres://cefr_user:cefr_secret_password@localhost:5432/cefr_db?sslmode=disable"
	}

	redisAddr := os.Getenv("REDIS_ADDR")
	if redisAddr == "" {
		redisAddr = "localhost:6379"
	}

	jwtSecret := os.Getenv("JWT_SECRET")
	if jwtSecret == "" {
		jwtSecret = "super_secret_cefr_jwt_key_2026_production_change_in_real_deploy"
	}

	// Connect to PostgreSQL with retry
	var db *sql.DB
	var err error
	for i := 0; i < 10; i++ {
		db, err = sql.Open("postgres", dbURL)
		if err == nil {
			if err = db.Ping(); err == nil {
				log.Println("Connected to PostgreSQL successfully.")
				break
			}
		}
		log.Printf("Waiting for PostgreSQL to be ready (%d/10)... error: %v", i+1, err)
		time.Sleep(2 * time.Second)
	}
	if err != nil {
		log.Fatalf("Could not connect to PostgreSQL: %v", err)
	}
	defer db.Close()

	// Connect to Redis (optional/resilient fallback)
	rdb := redis.NewClient(&redis.Options{
		Addr: redisAddr,
	})
	ctx, cancel := context.WithTimeout(context.Background(), 2*time.Second)
	defer cancel()
	if err := rdb.Ping(ctx).Err(); err != nil {
		log.Printf("Warning: Redis not reachable (%v). Using memory/DB fallback.", err)
	} else {
		log.Println("Connected to Redis successfully.")
	}

	repo := repository.NewRepository(db)
	h := handlers.NewHandler(repo, jwtSecret)

	router := gin.Default()

	// CORS Setup
	corsConfig := cors.DefaultConfig()
	corsConfig.AllowAllOrigins = true
	corsConfig.AllowHeaders = []string{"Origin", "Content-Type", "Accept", "Authorization"}
	corsConfig.AllowMethods = []string{"GET", "POST", "PUT", "PATCH", "DELETE", "OPTIONS"}
	router.Use(cors.New(corsConfig))

	// Health check
	router.GET("/health", func(c *gin.Context) {
		c.JSON(200, gin.H{
			"status":    "healthy",
			"service":   "cefr-core-backend",
			"timestamp": time.Now().UTC(),
		})
	})

	// API Routes
	api := router.Group("/api/v1")
	{
		// Public Auth
		api.POST("/auth/register", h.Register)
		api.POST("/auth/login", h.Login)

		// Public Tests listing
		api.GET("/tests", h.ListTests)

		// Authenticated Routes
		authRequired := api.Group("")
		authRequired.Use(auth.AuthMiddleware(jwtSecret))
		{
			authRequired.GET("/auth/me", h.Me)
			authRequired.GET("/tests/:id", h.GetTestDetails)
			authRequired.POST("/tests/:id/start", h.StartSession)
			authRequired.GET("/sessions/:id", h.GetSession)
			authRequired.POST("/sessions/:id/answer", h.SaveAnswer)
			authRequired.POST("/sessions/:id/submit", h.SubmitSession)
			authRequired.GET("/student/history", h.GetStudentResults)

			// Examiner & Admin Routes
			examinerOnly := authRequired.Group("/examiner")
			examinerOnly.Use(auth.RequireRole("examiner", "admin"))
			{
				examinerOnly.GET("/submissions", h.GetPendingSubmissions)
				examinerOnly.POST("/grade", h.GradeAnswer)
			}

			// Admin Only Routes
			adminOnly := authRequired.Group("/admin")
			adminOnly.Use(auth.RequireRole("admin"))
			{
				adminOnly.POST("/tests", h.CreateTest)
				adminOnly.DELETE("/tests/:id", h.DeleteTest)
				adminOnly.POST("/tests/:id/sections", h.CreateSection)
				adminOnly.POST("/sections/:sectionId/questions", h.CreateQuestion)
			}
		}
	}

	addr := fmt.Sprintf(":%s", port)
	log.Printf("CEFR Core Backend server starting on %s", addr)
	if err := router.Run(addr); err != nil {
		log.Fatalf("Server failed to run: %v", err)
	}
}
