# Serve Hugo site with minimal nginx
FROM nginx:alpine

COPY public/ /usr/share/nginx/html
