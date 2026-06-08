FROM nginx:1.30.2-alpine
COPY default.conf /etc/nginx/conf.d
EXPOSE 80
