
# The first stage
# Build React static files
FROM node:20.4-alpine as builder

WORKDIR /app/frontend
COPY ./frontend/package.json ./
COPY ./frontend/package-lock.json ./
RUN npm ci --silent
COPY ./frontend/ ./
RUN npm run build

# The second stage
# Copy React static files and start nginx
FROM nginx:stable-alpine
COPY --from=builder /app/frontend/dist /usr/share/nginx/html
CMD ["nginx", "-g", "daemon off;"]