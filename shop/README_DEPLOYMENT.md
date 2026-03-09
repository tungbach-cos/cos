# Deployment Guide

## Quick Start

### Deploy to Production

```bash
# Auto-increment patch version (1.0.0 → 1.0.1)
./scripts/deploy.sh

# Deploy specific version
./scripts/deploy.sh 1.2.3

# Test deployment without pushing
./scripts/deploy.sh --dry-run
```

### Via Cursor Command

You can also deploy using Cursor's command palette:
- Press `Cmd+Shift+P` (Mac) or `Ctrl+Shift+P` (Windows/Linux)
- Type: `deploy`
- Press Enter

## What Happens During Deployment

1. ✅ **Validates prerequisites** - Checks FVM, Flutter, Git
2. 🧹 **Cleans working tree** - Ensures no uncommitted changes
3. 🔨 **Builds Flutter web with Wasm** - Runs `fvm flutter build web --release --wasm`
4. 📦 **Creates deployment package** - Copies only `build/web/` contents to temp directory
5. 🌿 **Creates orphan branch** - Initializes clean git branch with no history
6. 💾 **Commits artifacts** - Commits with `chore(release): <version>`
7. 🚀 **Pushes to remote** - Force pushes to `deployment` branch

## Deployment Branch

The `deployment` branch contains **ONLY** the static build files:
- ✅ HTML, CSS, JavaScript files
- ✅ Assets (images, fonts, icons)
- ✅ Wasm/CanvasKit runtime files
- ❌ No source code (`lib/`, `test/`)
- ❌ No configuration files (`pubspec.yaml`, `analysis_options.yaml`)
- ❌ No repository metadata (except git history)

This makes it perfect for static hosting providers like:
- GitHub Pages
- Netlify
- Vercel
- Firebase Hosting
- Cloudflare Pages

## Versioning

Versions follow [Semantic Versioning](https://semver.org/):
- **MAJOR**: Breaking changes (1.0.0 → 2.0.0)
- **MINOR**: New features (1.0.0 → 1.1.0)
- **PATCH**: Bug fixes (1.0.0 → 1.0.1)

Update version in `pubspec.yaml` before deploying, or let the script auto-increment.

## Pre-Deployment Checklist

Before deploying:
- [ ] All tests pass: `fvm flutter test`
- [ ] Code is formatted: `fvm dart format .`
- [ ] No linter errors: `fvm dart analyze`
- [ ] All changes committed to `main`
- [ ] Update `CHANGELOG.md` with changes
- [ ] Test locally: `cd build/web && python3 -m http.server 8000`

## Hosting Setup

### GitHub Pages

1. Go to repository Settings → Pages
2. Source: Deploy from a branch
3. Branch: `deployment` / `/ (root)`
4. Save

Your site will be available at: `https://<username>.github.io/<repository>/`

### Netlify

1. New site from Git
2. Branch: `deployment`
3. Build command: (leave empty - pre-built)
4. Publish directory: `/` (root)

### Vercel

1. Import Git Repository
2. Branch: `deployment`
3. Root Directory: `./`
4. Build command: (leave empty)

## Rollback

If deployment fails, rollback to previous version:

```bash
# Switch to deployment branch
git checkout deployment

# Reset to previous commit
git reset --hard HEAD~1

# Force push
git push --force origin deployment
```

## Troubleshooting

### Build Fails
```bash
fvm flutter clean
fvm flutter pub get
fvm flutter build web --release --wasm
```

### Permission Issues
```bash
chmod +x scripts/deploy.sh
chmod +x .cursor/commands/deploy.sh
```

### Git Issues
```bash
# Delete and recreate deployment branch
git branch -D deployment
git push origin --delete deployment
./scripts/deploy.sh
```

## More Information

See `.cursor/rules/deployment.mdc` for complete deployment documentation.

