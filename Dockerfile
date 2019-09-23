# Build Hugo site
FROM squizduos/hugo-alpine:latest as builder

COPY . /app
WORKDIR /app

RUN hugo

# Serve Hugo site with minimal nginx
FROM squizduos/hugo-nginx:latest

COPY --from=builder /app/public/ /web/
