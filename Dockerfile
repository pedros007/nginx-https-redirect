FROM nginx:1.30.6-alpine
# Upgrade packages inherited from the base image, including NGINX module
# libraries used outside this redirect's configuration.
RUN apk upgrade --no-cache && \
    # Check installed versions for fixes to CVE-2026-125350 and CVE-2026-111497.
    apk info -e 'libxslt>=1.1.43-r4' 'brotli-libs>=1.2.1-r0'
COPY default.conf /etc/nginx/conf.d
EXPOSE 80
