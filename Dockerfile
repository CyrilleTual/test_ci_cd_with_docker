# Dockerfile 

# Stage 1: Build the Next.js application
FROM node:18-alpine AS builder
WORKDIR /app
RUN npm install -g pnpm
COPY package.json ./
RUN pnpm install
COPY . .
RUN pnpm run build

# Stage 2: Run the application
FROM node:18-alpine
WORKDIR /app
COPY --from=builder /app ./
RUN npm install -g pnpm
COPY prisma ./prisma
ENV DATABASE_URL="file:./myLocalDb.db"
ENV NEXT_TELEMETRY_DISABLED 1
RUN pnpx prisma migrate deploy
CMD ["pnpm", "run", "start"]


#command line to build and run the docker image
#docker build -t test_ci_cd_with_docker .
#command line to run the docker image locally
#docker run -p 3000:3000 test_ci_cd_with_docker