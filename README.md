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
  --name caddy-reverse-proxy-env-var \
  -e MAPPING='[{"example.com":"backend1:8080"},{"api.example.com":"backend2:9090"}]' \
  -p 80:80 \
  caddy-reverse-proxy-env-var
```

Add `http` if you want to disable https redirect

```bash
docker run -d \
  --name caddy-reverse-proxy-env-var \
  -e MAPPING='[{"http://example.com":"backend1:8080"},{"http://api.example.com":"backend2:9090"}]' \
  -p 80:80 \
  caddy-reverse-proxy-env-var
```

### MAPPING Format
The `MAPPING` environment variable should be a JSON array of objects, where each object maps a source URL to a target address. Example:

```json
[
  {"example.com": "backend1:8080"},
  {"api.example.com": "backend2:9090"}
]
```

## Debugging
To verify the configuration, check the container logs for the generated `Caddyfile`:

```bash
docker logs caddy-reverse-proxy-env-var
```

## Stopping and Cleaning Up
Stop and remove the container when it is no longer needed:

```bash
docker stop caddy-reverse-proxy-env-var
docker rm caddy-reverse-proxy-env-var
```

## Docker Hub Repository
You can pull the prebuilt image from Docker Hub:

[https://hub.docker.com/repository/docker/lenny4/caddy-reverse-proxy-env-var/general](https://hub.docker.com/repository/docker/lenny4/caddy-reverse-proxy-env-var/general)

To use the image from Docker Hub:

```bash
docker pull lenny4/caddy-reverse-proxy-env-var
```

## License
This project is licensed under the [MIT License](LICENSE). Contributions are welcome!
