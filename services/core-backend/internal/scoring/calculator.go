package scoring

import (
	"math"
)

// CalculateCEFRLevel returns the CEFR level string based on overall percentage
func CalculateCEFRLevel(percentage float64) string {
	rounded := math.Round(percentage*100) / 100

	switch {
	case rounded >= 80.0:
		return "C1"
	case rounded >= 65.0:
		return "B2"
	case rounded >= 50.0:
		return "B1"
	case rounded >= 35.0:
		return "A2"
	default:
		return "A1"
	}
}

// CalculatePercentage computes (earned / max) * 100 safely
func CalculatePercentage(earned, max float64) float64 {
	if max <= 0 {
		return 0
	}
	pct := (earned / max) * 100
	return math.Round(pct*10) / 10
}
