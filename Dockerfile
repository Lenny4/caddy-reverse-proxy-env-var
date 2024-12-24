FROM caddy:latest AS caddy_reverse_proxy_env_var

# Install jq for JSON processing
RUN apk add --no-cache jq

# Copy the custom entrypoint script
COPY --link --chmod=755 docker-entrypoint.sh /usr/local/bin/docker-entrypoint

# Set the entrypoint
ENTRYPOINT ["docker-entrypoint"]
