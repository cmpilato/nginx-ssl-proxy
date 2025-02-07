FROM nginx:latest

# Copy the configuration template, which the image startup process
# with copy (with envsubst) into place.
COPY default.conf.template /etc/nginx/templates/default.conf.template

# Copy the custom ceritificate generator.
COPY --chmod=755 00-generate-cert.sh /docker-entrypoint.d/00-generate-cert.sh
