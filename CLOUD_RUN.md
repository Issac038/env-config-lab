Cloud Run mapping

- Non-secret config (example `DATABASE_URL`, `LOG_LEVEL`, `PORT`):
  Use `--set-env-vars` when deploying. Example:

  gcloud run deploy my-service \
    --image gcr.io/PROJECT-ID/envlab:TAG \
    --set-env-vars DATABASE_URL="postgres://...",LOG_LEVEL="info",PORT="8080"

- Secrets (API keys, passwords):
  Store secrets in Secret Manager and map them at deploy time with `--set-secrets`.
  Example (Secret Manager name `API_KEY`):

  gcloud run deploy my-service \
    --image gcr.io/PROJECT-ID/envlab:TAG \
    --set-secrets API_KEY=projects/PROJECT_NUMBER/secrets/API_KEY:latest

Notes:
- Locally, keep secrets out of git. Use a git-ignored `.env` for non-secret defaults and `--env-file` when running `docker run`:

  docker run --env-file .env -e API_KEY="$API_KEY" --name app-fixed envlab

- Never bake secrets into the Docker image. If a secret was discovered in a Dockerfile, remove it and rotate the secret immediately.
