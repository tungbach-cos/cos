---
name: deployment
description: Deployment guidelines for Flutter web applications
---


# Deployment Rules

## Overview

This project uses a **deployment branch strategy** for Flutter web releases:
- Main development happens on `main` branch
- Production builds are committed to `deployment` branch
- Automated deployment via GitHub Pages or similar static hosting

## Deployment Process

### Manual Deployment

```bash
# Deploy current version to production
./scripts/deploy.sh

# Deploy with specific version
./scripts/deploy.sh 1.2.3

# Test deployment (dry-run)
./scripts/deploy.sh --dry-run
```

### Deployment Steps

1. **Build Flutter web app**
   - Command: `fvm flutter build web --release --wasm`
   - Generates optimized production build in `build/web/`
   - Uses WebAssembly for better performance
   - Includes CanvasKit renderer and Skwasm

2. **Create temporary deployment directory**
   - Copies only the contents of `build/web/` to temp directory
   - No source code or project structure included

3. **Initialize git in temp directory**
   - Creates orphan branch (clean history)
   - Adds remote pointing to origin

4. **Commit build artifacts**
   - Commits only build contents to `deployment` branch
   - Uses semantic commit message: `chore(release): <version>`
   - Includes timestamp in commit body

5. **Push to remote**
   - Force pushes to `deployment` branch
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
- Version stored in `pubspec.yaml`
- Script auto-increments patch version if not specified
- Manual version override: `./scripts/deploy.sh 2.0.0`

## Deployment Branch

### Branch Strategy
- `main`: Development branch (no build artifacts)
- `deployment`: Production branch (contains ONLY contents of `build/web/`)
- Deployment branch is an orphan branch (clean history, no source code)
- Deployment branch is force-pushed on each release

### Important Notes
- Deployment branch contains **only** static build files (HTML, CSS, JS, assets)
- No source code, no `lib/`, no `pubspec.yaml` on deployment branch
- This is ideal for static hosting (GitHub Pages, Netlify, Vercel, etc.)
- Build artifacts remain ignored on `main` branch via `.gitignore`

### .gitignore Configuration
```gitignore
# Main branch - ignore build artifacts
build/
```

**Note:** Build artifacts are never committed to `main`, only deployed to `deployment` branch

## Hosting Providers

### GitHub Pages
```yaml
# .github/workflows/deploy.yml
name: Deploy to GitHub Pages
on:
  push:
    branches: [deployment]
jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Deploy
        uses: peaceiris/actions-gh-pages@v3
        with:
          github_token: ${{ secrets.GITHUB_TOKEN }}
          publish_dir: ./build/web
```

### Netlify
- Branch: `deployment`
- Build directory: `build/web`
- Build command: (none - pre-built)

### Firebase Hosting
```bash
# Deploy from deployment branch
git checkout deployment
firebase deploy --only hosting
```

## Pre-Deployment Checklist

Before running deployment script:

- [ ] All tests pass: `fvm flutter test`
- [ ] Code is formatted: `fvm dart format .`
- [ ] No linter errors: `fvm dart analyze`
- [ ] All changes committed to `main`
- [ ] Update version in `pubspec.yaml` (if needed)
- [ ] Test build locally: `fvm flutter build web --release --wasm`
- [ ] Test built app: `cd build/web && python3 -m http.server 8000`

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
git checkout deployment
git reset --hard HEAD~1
git push --force origin deployment
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
# Clean and rebuild
fvm flutter clean
fvm flutter pub get
fvm flutter build web --release --wasm
```

### Git Issues
```bash
# Reset deployment branch
git branch -D deployment
git push origin --delete deployment
./scripts/deploy.sh
```

### Large Build Size
- Enable tree shaking: `--tree-shake-icons`
- Use deferred loading for large features
- Optimize images and assets
- Check for duplicate dependencies

## Security Considerations

### Deployment Branch Protection
- ⚠️ **Do NOT protect deployment branch** - needs force push
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
```bash
# GitHub Actions workflow
name: Auto Deploy
on:
  push:
    tags:
      - 'v*'
jobs:
  deploy:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Setup Flutter
        uses: subosito/flutter-action@v2
      - name: Deploy
        run: ./scripts/deploy.sh ${{ github.ref_name }}
```

## Summary

**Deployment Workflow:**
```
1. Develop on main branch
2. Run tests and linting
3. Update version in pubspec.yaml
4. Run: ./scripts/deploy.sh
5. Script builds, commits to deployment branch, pushes
6. Hosting provider rebuilds site
7. Verify deployment
```

**Key Commands:**
- Deploy: `./scripts/deploy.sh`
- Deploy with version: `./scripts/deploy.sh 1.2.3`
- Test: `./scripts/deploy.sh --dry-run`
- Rollback: `git checkout deployment && git reset --hard HEAD~1`
