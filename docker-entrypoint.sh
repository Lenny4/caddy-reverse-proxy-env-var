#!/bin/sh
set -e

# Check if MAPPING environment variable is set
if [ -z "$MAPPING" ]; then
    echo "Error: MAPPING environment variable is not set"
    exit 1
fi

# Generate the Caddyfile based on the MAPPING environment variable
CADDYFILE_PATH="/etc/caddy/Caddyfile"
: > "$CADDYFILE_PATH" # Clear existing Caddyfile or create a new one
echo "$MAPPING" | jq -c '.[]' | while read -r mapping; do
    URL=$(echo "$mapping" | jq -r 'keys[0]')
    TARGET=$(echo "$mapping" | jq -r '.[]')
    {
        echo "${URL} {"
        echo "        reverse_proxy ${TARGET}"
        echo "}"
    } >> "$CADDYFILE_PATH"
done

# Display the generated Caddyfile for debugging purposes
echo "Generated Caddyfile:"
cat "$CADDYFILE_PATH"

exec caddy run --config "$CADDYFILE_PATH"
