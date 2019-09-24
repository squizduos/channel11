# Serve Hugo site with minimal nginx
FROM nginx:alpine

COPY --from=builder /app/public/ /usr/share/nginx/html
