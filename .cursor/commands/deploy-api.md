# Deploy API Command

> Build Dart Frog API and deploy to Google Cloud Run

## Quick Usage

Run from the **repository root** (the script builds and deploys the app in `api/`):

```bash
# Build and deploy to Cloud Run
./.cursor/commands/scripts/deploy-api.sh

# Test without deploying
./.cursor/commands/scripts/deploy-api.sh --dry-run
```

## What This Command Does

The deploy-api command automates building and deploying the **API** (Dart Frog) app (`api/`):

1. **Validates environment** - Checks for `dart_frog` CLI, `gcloud`, and that `api/` exists
2. **Builds production app** - Runs `dart_frog build` in `api/` (output in `api/build/`)
3. **Deploys to Cloud Run** - Runs `gcloud run deploy tungbach --source build` with project and region

## Cloud Run Configuration

| Option | Value |
|--------|--------|
| Service | `tungbach` |
| Project | `tung-bach-cos` |
| Region | `asia-southeast3` |
| Auth | `--allow-unauthenticated` |

The script uses `--source build` so Cloud Run builds the container from the Dart Frog build output in `api/build/`.

## Prerequisites

Before deploying:

- [ ] **Dart Frog CLI** - `dart pub global activate dart_frog_cli` (and `dart_frog` on PATH)
- [ ] **gcloud CLI** - [Install](https://cloud.google.com/sdk/docs/install) and `gcloud auth login`
- [ ] **Project access** - Your account has Cloud Run deploy rights for `tung-bach-cos`
- [ ] **From repo root** - Run the script from the repository root (not from `api/`)

## Command Options

```bash
# Show help
./.cursor/commands/scripts/deploy-api.sh --help

# Dry run (print commands only)
./.cursor/commands/scripts/deploy-api.sh --dry-run
```

## Deployment Workflow

```
┌─────────────────────────────────────────────────────┐
│ 1. From repo root: ./.cursor/commands/scripts/      │
│    deploy-api.sh                                     │
└────────────────┬────────────────────────────────────┘
                 │
                 ▼
┌─────────────────────────────────────────────────────┐
│ 2. dart_frog build (in api/) → api/build/            │
└────────────────┬────────────────────────────────────┘
                 │
                 ▼
┌─────────────────────────────────────────────────────┐
│ 3. gcloud run deploy tungbach --source build         │
│    (project: tung-bach-cos, region: asia-southeast3)  │
└────────────────┬────────────────────────────────────┘
                 │
                 ▼
┌─────────────────────────────────────────────────────┐
│ 4. API is live on Cloud Run 🚀                       │
└─────────────────────────────────────────────────────┘
```

## Troubleshooting

### "dart_frog not found"

```bash
dart pub global activate dart_frog_cli
# Ensure pub cache bin is on PATH, e.g.:
export PATH="$PATH:$HOME/.pub-cache/bin"
```

### "gcloud not found"

Install [Google Cloud SDK](https://cloud.google.com/sdk/docs/install) and log in:

```bash
gcloud auth login
gcloud config set project tung-bach-cos
```

### "dart_frog build failed"

From `api/`:

```bash
cd api
dart pub get
dart_frog build
```

Fix any analyzer or build errors before deploying.

### Permission denied on script

From repo root:

```bash
chmod +x .cursor/commands/scripts/deploy-api.sh
./.cursor/commands/scripts/deploy-api.sh
```

## Summary

- **Script**: `.cursor/commands/scripts/deploy-api.sh`
- **Build**: `dart_frog build` in `api/`
- **Deploy**: `gcloud run deploy tungbach --source build --project=tung-bach-cos --region=asia-southeast3 --allow-unauthenticated`

For the Flutter shop deployment (static branch), see `.cursor/commands/deploy-shop.md`.
