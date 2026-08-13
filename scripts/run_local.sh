#!/usr/bin/env bash
set -euo pipefail

# Usage: copy .env.example -> .env and set API_KEY locally (do NOT commit .env)
# Then run: ./scripts/run_local.sh

IMAGE_NAME=envlab
CONTAINER_NAME=app-fixed

if [ ! -f .env ]; then
  echo ".env file not found. Copy .env.example to .env and fill values." >&2
  exit 1
fi

echo "Building image ${IMAGE_NAME}..."
docker build -t "${IMAGE_NAME}" .

echo "Running container ${CONTAINER_NAME} with .env and API_KEY from environment..."
docker rm -f "${CONTAINER_NAME}" 2>/dev/null || true
docker run --env-file .env -e API_KEY="$API_KEY" --name "${CONTAINER_NAME}" "${IMAGE_NAME}"

echo "Container started. Use 'docker logs ${CONTAINER_NAME}' to view logs." 
