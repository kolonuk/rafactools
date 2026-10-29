# Static launcher served by unprivileged nginx (UID 101, port 8080). The
# planner and any other sub-app are separate services routed by sub-path in
# the dadock stack; this image only serves the menu at /.
FROM nginxinc/nginx-unprivileged:1.29-alpine

COPY nginx.conf /etc/nginx/conf.d/default.conf
COPY index.html /usr/share/nginx/html/
COPY assets/ /usr/share/nginx/html/assets/

EXPOSE 8080
