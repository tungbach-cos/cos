---
name: shop-deployment-guidelines
description: Deployment guidelines for Flutter web applications (shop)
---


# Deployment Rules

## Quick Start

Run from the **repository root**:

```bash
# Auto-increment patch version (1.0.0 → 1.0.1)
./.cursor/commands/scripts/deploy-shop.sh

# Deploy specific version
./.cursor/commands/scripts/deploy-shop.sh 1.2.3

# Test without pushing
./.cursor/commands/scripts/deploy-shop.sh --dry-run
```

**Via Cursor:** `Cmd+Shift+P` (Mac) or `Ctrl+Shift+P` (Windows/Linux) → type **deploy** → Enter (runs deploy-shop command).

## Overview

The `shop` Flutter web app uses a **deployment branch strategy**:
- Main development happens on `main` branch
- Production builds are committed to `deployment/shop` branch
- Automated deployment via GitHub Pages or similar static hosting

## Deployment Process

### Manual Deployment

Run from the **repository root** (the script deploys the app in `shop/`):

```bash
# Deploy current version to production (auto-increment patch)
./.cursor/commands/scripts/deploy-shop.sh

# Deploy with specific version
./.cursor/commands/scripts/deploy-shop.sh 1.2.3

# Test deployment (dry-run)
./.cursor/commands/scripts/deploy-shop.sh --dry-run
```

### Deployment Steps

1. **Build Flutter web app**
   - Command (from `shop/`): `fvm flutter build web --release --wasm`
   - Generates optimized production build in `shop/build/web/`
   - Uses WebAssembly for better performance
   - Includes CanvasKit renderer and Skwasm

2. **Create temporary deployment directory**
   - Copies only the contents of `shop/build/web/` to temp directory
   - No source code or project structure included

3. **Initialize git in temp directory**
   - Creates orphan branch (clean history)
   - Adds remote pointing to origin

4. **Commit build artifacts**
   - Commits only build contents to `deployment/shop` branch
   - Uses semantic commit message: `chore(release): <version>`
   - Includes timestamp in commit body

5. **Push to remote**
   - Force pushes to `deployment/shop` branch
   - Triggers hosting service rebuild (GitHub Pages, Netlify, etc.)
   - Deployment branch contains only static files, no source code

## Versioning

### Semantic Versioning
- Format: `MAJOR.MINOR.PATCH`
- Example: `1.2.3`
- MAJOR: Breaking changes
- MINOR: New features (backward compatible)
- PATCH: Bug fixes

### Version Management
- Version stored in `shop/pubspec.yaml`
- Deploy script auto-increments patch version if not specified
- Manual version override: `./.cursor/commands/scripts/deploy-shop.sh 2.0.0`

## Deployment Branch

### Branch Strategy
- `main`: Development branch (no build artifacts)
- `deployment/shop`: Production branch (contains ONLY contents of `shop/build/web/`)
- Deployment branch is an orphan branch (clean history, no source code)
- Deployment branch is force-pushed on each release

### Important Notes
- Deployment branch contains **only** static build files (HTML, CSS, JS, assets)
- No source code, no `lib/`, no `pubspec.yaml` on deployment branch
- This is ideal for static hosting (GitHub Pages, Netlify, Vercel, Firebase Hosting, Cloudflare Pages)
- Build artifacts remain ignored on `main` branch via `.gitignore`

### .gitignore Configuration
```gitignore
# Main branch - ignore build artifacts
shop/build/
```

**Note:** Build artifacts are never committed to `main`, only deployed to `deployment/shop` branch

## Hosting Providers

### GitHub Pages
- Source branch: `deployment/shop`
- Publish directory: `/` (root of deployment branch)

### Netlify
- Branch: `deployment/shop`
- Build directory: `/` (pre-built)
- Build command: (none - pre-built)

### Firebase Hosting
- Use `deployment/shop` branch as source for static hosting

## Pre-Deployment Checklist

Before running deploy command from repo root:

- [ ] All tests pass (from `shop/`): `fvm flutter test`
- [ ] Code is formatted (from `shop/`): `fvm dart format .`
- [ ] No linter errors (from `shop/`): `fvm dart analyze`
- [ ] All changes committed to `main`
- [ ] Update version in `shop/pubspec.yaml` (if needed)
- [ ] Update `CHANGELOG.md` with changes (if applicable)
- [ ] Test build locally (from `shop/`): `fvm flutter build web --release --wasm`
- [ ] Test built app: `cd shop/build/web && python3 -m http.server 8000`

## Post-Deployment Verification

After deployment:

- [ ] Verify deployment URL loads correctly
- [ ] Test critical user flows
- [ ] Check browser console for errors
- [ ] Test on multiple browsers (Chrome, Firefox, Safari)
- [ ] Test on mobile devices
- [ ] Verify assets load correctly (images, fonts, icons)
- [ ] Check that routing works properly

## Rollback Procedure

If deployment fails:

```bash
# Rollback to previous commit on deployment branch
git checkout deployment/shop
git reset --hard HEAD~1
git push --force origin deployment/shop
```

## Environment Variables

### Production Environment
- Set in hosting provider dashboard
- Not committed to repository
- Examples:
  - `API_BASE_URL`
  - `FIREBASE_CONFIG`
  - `ANALYTICS_ID`

### Build-time Configuration
```dart
// lib/config/environment.dart
class Environment {
  static const bool isProduction = bool.fromEnvironment('PRODUCTION');
  static const String apiUrl = String.fromEnvironment(
    'API_URL',
    defaultValue: 'https://api.example.com',
  );
}
```

## Troubleshooting

### Build Fails
```bash
# Clean and rebuild (from shop/)
cd shop
fvm flutter clean
fvm flutter pub get
fvm flutter build web --release --wasm
cd ..
```

### Git Issues
```bash
# Reset deployment branch
git branch -D deployment/shop
git push origin --delete deployment/shop
./.cursor/commands/scripts/deploy-shop.sh
```

### Permission denied on script
From repo root:
```bash
chmod +x .cursor/commands/scripts/deploy-shop.sh
./.cursor/commands/scripts/deploy-shop.sh
```

### Large Build Size
- Enable tree shaking: `--tree-shake-icons`
- Use deferred loading for large features
- Optimize images and assets
- Check for duplicate dependencies

## Security Considerations

### Deployment Branch Protection
- ⚠️ **Do NOT protect deployment/shop branch** - needs force push
- Protect `main` branch instead
- Require pull requests for `main`
- Run CI/CD checks on `main`

### Secrets Management
- Never commit secrets to any branch
- Use environment variables
- Use secrets management service
- Rotate credentials regularly

## Best Practices

### DO ✅
1. **Test locally** before deploying
2. **Increment version** for each release
3. **Document breaking changes** in commit message
4. **Monitor deployment** for errors
5. **Keep deployment branch clean** (force push is OK)
6. **Tag releases** on main branch: `git tag v1.2.3`

### DON'T ❌
1. **DON'T commit build artifacts to main** - only on deployment branch
2. **DON'T deploy without testing** - always test locally first
3. **DON'T deploy from dirty working tree** - commit changes first
4. **DON'T skip version updates** - maintain proper versioning
5. **DON'T deploy during high traffic** - plan deployment windows
6. **DON'T ignore deployment errors** - investigate immediately

## Monitoring

### Deployment Metrics
- Track deployment frequency
- Monitor build times
- Track deployment failures
- Monitor page load times

### Error Tracking
- Set up error monitoring (Sentry, Crashlytics)
- Monitor browser console errors
- Track user-reported issues
- Monitor performance metrics

## Continuous Deployment

### Automated Deployment
```yaml
# .github/workflows/deploy.yml
name: Deploy
on:
  push:
    tags:
      - 'v*'
jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: subosito/flutter-action@v2
      - name: Deploy
        run: ./.cursor/commands/scripts/deploy-shop.sh ${{ github.ref_name }}
```

## Summary

**Deployment Workflow (shop app):**
```
1. Develop on main branch
2. Run tests and linting from shop/
3. Update version in shop/pubspec.yaml
4. From repo root: ./.cursor/commands/scripts/deploy-shop.sh
5. Script builds shop/, commits to deployment/shop branch, pushes
6. Hosting provider rebuilds site
7. Verify deployment
```

**Key Commands:**
- Deploy: `./.cursor/commands/scripts/deploy-shop.sh`
- Deploy with version: `./.cursor/commands/scripts/deploy-shop.sh 1.2.3`
- Test: `./.cursor/commands/scripts/deploy-shop.sh --dry-run`
- Rollback: `git checkout deployment/shop && git reset --hard HEAD~1`

For full deploy command details, see `.cursor/commands/deploy-shop.md`.
