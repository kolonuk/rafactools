# Static launcher served by unprivileged nginx (UID 101, port 8080). The
# planner and any other sub-app are separate services routed by sub-path in
# the dadock stack; this image only serves the menu at /.
FROM nginxinc/nginx-unprivileged:1.29-alpine

# The base image's own baked-in Alpine packages lag behind the upstream
# security repo (confirmed live, 2026-10-29: util-linux, libxml2, pcre2 and
# tiff all had CRITICAL/HIGH CVEs with a fixed version already published),
# which fails this repo's own Trivy gate on every build — the image never
# reaches GHCR. apk upgrade here, not a newer base tag, because the tag
# itself will lag again; this stays correct as long as Alpine's own
# security repo does. Root only for the upgrade — USER nginx (same user the
# base image already runs as) before anything else.
USER root
RUN apk update && apk upgrade --no-cache
USER nginx

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY index.html /usr/share/nginx/html/
COPY assets/ /usr/share/nginx/html/assets/

EXPOSE 8080
