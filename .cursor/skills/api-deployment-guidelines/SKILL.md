---
name: api-deployment-guidelines
description: Deployment guidelines for Dart Frog API to Google Cloud Run
---


# API Deployment Rules

## Quick Start

Run from the **repository root** (the script builds and deploys the app in `api/`):

```bash
# Build and deploy to Cloud Run
./.cursor/commands/scripts/deploy-api.sh

# Test without deploying (print commands only)
./.cursor/commands/scripts/deploy-api.sh --dry-run
```

**Via Cursor:** `Cmd+Shift+P` (Mac) or `Ctrl+Shift+P` (Windows/Linux) → type **deploy-api** → Enter (if a deploy-api command is configured).

## Overview

The **API** (Dart Frog) app in `api/` is deployed to **Google Cloud Run**:
- Build: `dart_frog build` produces `api/build/`
- Deploy: `gcloud run deploy` uses `--source build` so Cloud Run builds the container from that output
- No deployment branch; each run builds and deploys directly to Cloud Run

## Deployment Process

### Manual Deployment

Run from the **repository root**:

```bash
# Build and deploy
./.cursor/commands/scripts/deploy-api.sh

# Dry run (no changes)
./.cursor/commands/scripts/deploy-api.sh --dry-run
```

### Deployment Steps

1. **Validate prerequisites**
   - Checks for `dart_frog` CLI, `gcloud` CLI
   - Ensures `api/` and `api/pubspec.yaml` exist

2. **Build Dart Frog app**
   - Command (from `api/`): `dart_frog build`
   - Output: `api/build/` (used by Cloud Run as source)

3. **Deploy to Cloud Run**
   - `gcloud run deploy tungbach --source build --project=tung-bach-cos --region=asia-southeast3 --allow-unauthenticated`
   - Cloud Run builds the container from `api/build/` and deploys the service

## Cloud Run Configuration

| Option   | Value             |
|----------|-------------------|
| Service  | `tungbach`        |
| Project  | `tung-bach-cos`   |
| Region   | `asia-southeast3` |
| Auth     | `--allow-unauthenticated` |

Build output: `api/build/` (script runs `gcloud` from `api/` so `--source build` is correct).

## Pre-Deployment Checklist

Before running deploy from repo root:

- [ ] All changes committed to `main` (or your branch)
- [ ] From `api/`: `dart pub get`
- [ ] No linter errors (from repo root): `dart analyze api`
- [ ] Code formatted: `dart format api/`
- [ ] Optional: run tests if present (e.g. `dart test` in `api/`)
- [ ] Test build locally (from `api/`): `dart_frog build` (then run locally if desired)

## Post-Deployment Verification

After deployment:

- [ ] Service URL loads (Cloud Run console or `gcloud run services describe tungbach --region=asia-southeast3`)
- [ ] Health/readiness endpoint responds (e.g. `GET /` or `/health` if configured)
- [ ] Critical API endpoints work (e.g. products, categories)
- [ ] Check Cloud Run logs for errors

## Environment Variables & Secrets

### Cloud Run

- Set **environment variables** or **secrets** in Cloud Run (Console → Service → Edit → Variables & Secrets), not in code.
- Examples: database URL, API keys, Supabase URL/key.
- Never commit secrets to the repository.

### Local vs production

- Use `--set-env-vars` or Cloud Run secret manager for production config.
- Keep defaults and local config out of version control.

## Troubleshooting

### dart_frog not found

```bash
dart pub global activate dart_frog_cli
# Ensure pub cache bin is on PATH:
export PATH="$PATH:$HOME/.pub-cache/bin"
```

### gcloud not found

Install [Google Cloud SDK](https://cloud.google.com/sdk/docs/install) and authenticate:

```bash
gcloud auth login
gcloud config set project tung-bach-cos
```

### dart_frog build failed

From `api/`:

```bash
cd api
dart pub get
dart analyze
dart_frog build
```

Fix any analyzer or build errors before deploying.

### gcloud run deploy failed

- Confirm project and region: `gcloud config get-value project`
- Confirm Cloud Run API is enabled: `gcloud services enable run.googleapis.com`
- Check IAM: your account needs `roles/run.admin` and (if using build from source) `roles/cloudbuild.builds.builder` or equivalent

### Permission denied on script

From repo root:

```bash
chmod +x .cursor/commands/scripts/deploy-api.sh
./.cursor/commands/scripts/deploy-api.sh
```

## Security Considerations

### Secrets

- Do not commit secrets (Supabase keys, DB URLs, etc.) to any branch.
- Use Cloud Run environment variables or Secret Manager.
- Restrict who can deploy (IAM: Cloud Run Admin, Cloud Build if applicable).

### Allow unauthenticated

- Script uses `--allow-unauthenticated` for public API access. If the API should be private, remove that flag and use IAM or identity-aware access.

## Best Practices

### DO ✅

1. **Test locally** – run `dart_frog build` and test the app before deploying.
2. **Run analyzer** – `dart analyze api` with zero issues before deploy.
3. **Use dry-run** – `./.cursor/commands/scripts/deploy-api.sh --dry-run` to confirm commands.
4. **Monitor logs** – check Cloud Run logs after deployment.
5. **Pin dependencies** – keep `api/pubspec.yaml` dependencies versioned.

### DON'T ❌

1. **Don't commit secrets** – use Cloud Run config or Secret Manager.
2. **Don't deploy with failing build** – fix `dart_frog build` and analyzer first.
3. **Don't skip dry-run** when changing the script or pipeline.

## Monitoring

### Cloud Run

- **Logs:** Cloud Console → Cloud Run → tungbach → Logs.
- **Metrics:** Request count, latency, errors, instance count.
- **Alerts:** Set up alerts on error rate or latency if needed.

### API health

- Use a health route (e.g. `routes/health.dart`) and monitor it from uptime checks or Cloud Monitoring.

## Continuous Deployment

### Example: deploy on push to main

```yaml
# .github/workflows/deploy-api.yml
name: Deploy API
on:
  push:
    branches: [main]
    paths:
      - 'api/**'
jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v4
      - uses: dart-lang/setup-dart@v1
        with:
          sdk: stable
      - name: Install dart_frog_cli
        run: dart pub global activate dart_frog_cli
      - name: Deploy to Cloud Run
        run: ./.cursor/commands/scripts/deploy-api.sh
        env:
          # Or use Secret Manager / workload identity for gcloud auth
          CLOUDSDK_AUTH_CREDENTIAL_FILE_OVERRIDE: ${{ secrets.GCP_SA_KEY }}
```

(Adjust auth and triggers to your setup.)

## Summary

**Deployment Workflow (API):**
```
1. From repo root: ./.cursor/commands/scripts/deploy-api.sh
2. Script checks dart_frog + gcloud, then runs dart_frog build in api/
3. Script runs gcloud run deploy tungbach --source build (from api/)
4. Cloud Run builds container and deploys; API is live
5. Verify via service URL and logs
```

**Key Commands:**
- Deploy: `./.cursor/commands/scripts/deploy-api.sh`
- Dry run: `./.cursor/commands/scripts/deploy-api.sh --dry-run`
- Help: `./.cursor/commands/scripts/deploy-api.sh --help`

For full deploy command details, see `.cursor/commands/deploy-api.md`.  
For the Flutter shop (static branch) deployment, see `.cursor/skills/shop-deployment-guidelines/SKILL.md` and `.cursor/commands/deploy-shop.md`.
