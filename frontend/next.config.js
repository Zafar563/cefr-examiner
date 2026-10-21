/** @type {import('next').NextConfig} */
const nextConfig = {
  reactStrictMode: true,
  output: 'standalone',
  images: {
    unoptimized: true,
  },
  async rewrites() {
    const coreBackendUrl = process.env.CORE_API_URL || 'http://core-backend:8080';
    const mediaServiceUrl = process.env.MEDIA_API_URL || 'http://media-service:8000';
    return [
      {
        source: '/api/v1/:path*',
        destination: `${coreBackendUrl}/api/v1/:path*`,
      },
      {
        source: '/storage/:path*',
        destination: `${mediaServiceUrl}/storage/:path*`,
      },
    ];
  },
};

module.exports = nextConfig;
