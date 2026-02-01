# Build stage
FROM oven/bun:1-alpine AS builder
WORKDIR /app

# Copy package files
COPY package.json bun.lock ./
RUN bun install --frozen-lockfile

# Copy source and build
COPY . .
RUN bun run build

# Production stage
FROM node:22-alpine
WORKDIR /app

# Copy built application
COPY --from=builder /app/build ./build
COPY --from=builder /app/package.json ./
COPY --from=builder /app/node_modules ./node_modules

# Expose port
EXPOSE 3000

# Environment defaults
ENV HOST=0.0.0.0
ENV PORT=3000

# Start the application
CMD ["node", "build"]
