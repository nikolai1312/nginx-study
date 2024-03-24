FROM cgr.dev/chainguard/nginx:latest

EXPOSE 8080

COPY ./src/nginx.conf /etc/nginx/nginx.conf

COPY ./src/ /usr/share/nginx/html/
