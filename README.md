# zola-docker

This is a Docker image that contains the Zola binary ([https://www.getzola.org/](https://www.getzola.org/)). It can be used for development and/or CI/CD workflows.

## Example Usage

1. Build docker image
    ```bash
    docker build -t zola:v0.11.0 .
    ```
1. Build site
    ```bash
    cd /my/zola/site/
    PROJECT_ROOT="$(git rev-parse --show-toplevel)" && \
    docker run \
      --rm \
      -it \
      -u $(id -u ${USER}):$(id -g ${USER}) \
      -v "${PROJECT_ROOT}:/site" \
      zola:v0.11.0 \
      bash -c 'cd /site && zola build -o docs'
    ```
1. Serve site (for local development)
    ```bash
    cd /my/zola/site/
    PROJECT_ROOT="$(git rev-parse --show-toplevel)" && \
    docker run \
      --rm \
      -it \
      -u $(id -u ${USER}):$(id -g ${USER}) \
      -v "${PROJECT_ROOT}:/site" \
      -p 127.0.0.1:1111:1111 \
      zola:v0.11.0 \
      bash -c 'cd /site && zola serve -i 0.0.0.0'
    ```
