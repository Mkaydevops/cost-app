# Build stage
FROM node:18-alpine AS builder

WORKDIR /app
COPY package*.json ./
RUN npm install --production
COPY . .

# Production stage (distroless optional)
FROM gcr.io/distroless/nodejs18

WORKDIR /app
COPY --from=builder /app .

EXPOSE 3000
CMD ["index.js"]