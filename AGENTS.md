# NGINX HTTPS Redirect agent instructions

Keep changes easy for a maintainer to understand and review. Read the nearby
files and [README](README.md) before editing; follow this repository's simple
patterns.

## Application layout

This repository builds one Docker image that redirects HTTP requests to HTTPS.

- [Dockerfile](Dockerfile) selects the official NGINX Alpine base and installs
  runtime package fixes. A package can be present through a base-image
  dependency even when the redirect does not call it directly.
- [default.conf](default.conf) listens on port 80 and returns a permanent
  redirect to `https://$host$request_uri`. Preserve the host, path, and query
  string when changing the redirect.
- [CHANGELOG.md](CHANGELOG.md) records released changes. The image is published
  as `pedros007/nginx-https-redirect` on Docker Hub.

## Building and testing

Build and test the image with Docker. For a configuration change, run
`nginx -t` in the built image and send an HTTP request with a Host header,
path, and query string; confirm the 301 response and Location header. For a
base-image or package change, check the installed package versions on both
`linux/amd64` and `linux/arm64`. A newer NGINX tag alone does not prove a
transitive package is fixed.

Before publishing a multi-platform release, build both architectures and
verify them. After pushing, run `docker buildx imagetools inspect` on the
versioned Docker Hub tag and confirm both platforms are present.

## Releases and changelog

- Follow [Keep a Changelog](https://keepachangelog.com/en/1.1.0/) and
  [Semantic Versioning](https://semver.org/spec/v2.0.0.html). Treat the image's
  documented redirect behavior and supported platforms as its public contract.
- Preserve the existing entries, headings, and dates in `CHANGELOG.md` for
  posterity. For future notable changes, start an `## [Unreleased]` section at
  the top. Group entries under the applicable `### Added`, `### Changed`,
  `### Deprecated`, `### Removed`, `### Fixed`, or `### Security` headings. Use
  short, plain-language bullets that describe the effect for image users.
- During release preparation, move the relevant unreleased entries into a new
  `## [X.Y.Z] - YYYY-MM-DD` section, newest first. Choose the version based on
  compatibility: patch for compatible fixes, minor for compatible additions,
  and major for breaking changes. Consider SemVer's special rules for `0.x`
  releases. Assign the date when the release is published. Link new version
  headings and `Unreleased` to the corresponding GitHub tag or comparison.
- Give every published version its own immutable Git tag and Docker image tag.
  Publish later changes under a new version. Use the numeric SemVer value for
  Docker tags; a `v` prefix is acceptable for Git tags.
- Keep the changelog focused on notable user-facing changes. Internal agent
  guidance, formatting, and CI-only changes need no entry. Do not turn the
  changelog into a commit log or rewrite earlier release notes.

## Scope and writing

- Keep each change focused. Comments should explain intent, constraints, or
  surprising behavior such as a transitive dependency, rather than restating
  the Dockerfile instruction.
- Write documentation and release notes in plain English. Use short sentences
  and consistent names. State which checks ran and any remaining limitation.

## Git history and review

Keep `master` deployable. Review the diff and run `git diff --check` before
requesting review or making a release. Keep history linear and avoid rewriting
published release tags or commits.
