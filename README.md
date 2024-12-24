# Caddy Reverse Proxy with Dynamic Mappings

This project provides a Dockerized Caddy reverse proxy that dynamically generates its configuration (`Caddyfile`) based on mappings defined in the `MAPPING` environment variable.

## Features
- **Dynamic Configuration**: The `Caddyfile` is generated at runtime based on the `MAPPING` environment variable.
- **Lightweight**: Built on the official Caddy web server image.
- **Simple to Use**: Configure URL mappings using a single JSON variable.

## Prerequisites
- [Docker](https://www.docker.com/) installed on your system.

## Build the Docker Image
Run the following command to build the Docker image:

```bash
docker build -t caddy-reverse-proxy-env-var .
```

## Run the Container
Start a container with your desired mappings:

```bash
docker run -d \
  --name my-caddy-container \
  -e MAPPING='[{"example.com":"http://backend1:8080"},{"api.example.com":"http://backend2:9090"}]' \
  -p 80:80 \
  caddy-reverse-proxy-env-var
```

### MAPPING Format
The `MAPPING` environment variable should be a JSON array of objects, where each object maps a source URL to a target address. Example:

```json
[
  {"example.com": "http://backend1:8080"},
  {"api.example.com": "http://backend2:9090"}
]
```

## Debugging
To verify the configuration, check the container logs for the generated `Caddyfile`:

```bash
docker logs my-caddy-container
```

## Stopping and Cleaning Up
Stop and remove the container when it is no longer needed:

```bash
docker stop my-caddy-container
docker rm my-caddy-container
```

## License
This project is licensed under the [MIT License](LICENSE). Contributions are welcome!
