FROM nginx:1.30.2-alpine
# The base image includes vulnerable brotli-libs 1.2.0-r0 through libcurl and
# freetype, even though this redirect does not decompress Brotli requests.
# Require Alpine's 1.2.1-r0 fix for CVE-2026-111497.
RUN apk add --no-cache 'brotli-libs>=1.2.1-r0'
COPY default.conf /etc/nginx/conf.d
EXPOSE 80
