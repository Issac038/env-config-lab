# LU 4.7 — Fixing Environment Variables in Cloud Deployments

## Overview
This repository is an assessment for debugging and fixing environment variable configurations in a containerized Node.js application.

The application currently fails to start correctly because one or more configuration issues exist. 
Use logs and environment inspection to diagnose the problem.

## Setup Instructions

1. Build the Docker image:
   ```bash
   docker build -t envlab .
   ```

2. Run the container:
   ```bash
   docker run --name app envlab
   ```

## Task

1. The application fails to start. Diagnose the issue using `docker logs app` and fix it.
2. Identify and resolve any configuration variable mismatches.
3. Find and remove any hardcoded secrets. Use proper runtime injection.
4. Ensure your local `.env` file (which you need to create) is not tracked by Git.
5. Fill out `docs/cloud-run-template.md` categorizing variables correctly.

Good luck!

## Verify locally

Docker is required to run the image locally. If Docker is running, verify the fix:

1. Copy the example and set your local values (do NOT commit real secrets):

```bash
cp .env.example .env
# edit .env and fill DATABASE_URL and PORT; keep API_KEY empty here
```

2. Export `API_KEY` in your shell (or provide a real value for testing):

```bash
export API_KEY="your-local-api-key"
```

3. Build & run with the helper script (or run the docker commands directly):

```bash
./scripts/run_local.sh
```

4. Check logs and environment from the running container:

```bash
docker logs app-fixed
docker exec app-fixed printenv
```

If Docker isn't available here, these steps must be run on a machine with Docker.
