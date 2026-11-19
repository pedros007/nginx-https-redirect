# Changelog

## [Unreleased]

## [0.1.3] - 2026-11-19

### Security

- Updated NGINX to 1.30.7 and refreshed inherited Alpine packages to include current security fixes.

## [0.1.2] - 2026-11-13

### Security

- Upgraded NGINX and inherited packages to fix CVE-2026-125350 in libxslt and retain the Brotli fix for CVE-2026-111497.

## v0.1.1 - 2026-10-23

- Updated Brotli libraries to fix CVE-2026-111497.

## v0.1.0 - 2026-06-08

- Updated the Dockerfile to build from the current stable Alpine-based nginx image.

## v0.0.0 - 2017-10-04

- Created the initial nginx HTTPS redirect image.
- Added nginx configuration to redirect HTTP requests to HTTPS.

[Unreleased]: https://github.com/pedros007/nginx-https-redirect/compare/v0.1.3...HEAD
[0.1.3]: https://github.com/pedros007/nginx-https-redirect/releases/tag/v0.1.3
[0.1.2]: https://github.com/pedros007/nginx-https-redirect/releases/tag/0.1.2
