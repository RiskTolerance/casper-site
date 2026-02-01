FROM oven/bun:latest

# Install wget for healthchecks
RUN apt-get update && apt-get install -y wget && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY package.json bun.lock ./
RUN bun install --frozen-lockfile

COPY . .
RUN bun run build

EXPOSE 3000

ENV NODE_ENV=production

HEALTHCHECK --interval=30s --timeout=10s --start-period=40s --retries=3 CMD wget --spider -q http://localhost:3000 || exit 1

CMD ["bun", "build/index.js"]
