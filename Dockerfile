FROM squizduos/hugo-alpine:latest as builder

COPY . /app
WORKDIR /app

RUN hugo

# FROM nginx:alpine
FROM flashspys/nginx-static
COPY --from=builder /app/public/ /static/

# EXPOSE 80

# # root user will run 'nginx: master process'
# # nobody user will run 'nginx: worker process' as dictated in the nginx.non-root.conf
# CMD ["nginx", "-g", "daemon off;"]
