# Build Hugo site
FROM squizduos/hugo-alpine:latest as builder

COPY . /app
WORKDIR /app

RUN hugo

# Serve Hugo site with minimal nginx
FROM nginx:alpine

COPY --from=builder /app/public/ /usr/share/nginx/html
