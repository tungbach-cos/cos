# Deploy Command

> Deploy Flutter web application to production

## Quick Usage

```bash
# Auto-increment version (1.0.0 → 1.0.1)
./scripts/deploy.sh

# Deploy specific version
./scripts/deploy.sh 1.2.3

# Test without deploying
./scripts/deploy.sh --dry-run
```

## What This Command Does

The deploy command automates the entire Flutter web deployment process:

1. **Validates environment** - Checks FVM, Flutter, Git, and working tree
2. **Builds production app** - Runs `fvm flutter build web --release --wasm`
3. **Creates clean deployment** - Copies only `build/web/` contents to temporary directory
4. **Commits to deployment branch** - Creates orphan branch with only static files
5. **Pushes to remote** - Force pushes to `deployment` branch
6. **Cleans up** - Removes temporary files and returns to original branch

## Deployment Branch

The `deployment` branch contains **only** production build artifacts:

✅ **Included:**
- `index.html` - Main application entry point
- `main.dart.js` - Compiled Dart code (~2.8MB)
- `flutter.js`, `flutter_bootstrap.js` - Flutter runtime
- `assets/` - Images, fonts, icons
- `canvaskit/` - WebAssembly runtime files
- `manifest.json`, `version.json` - App metadata

❌ **Not included:**
- No source code (`lib/`, `test/`)
- No configuration (`pubspec.yaml`, `analysis_options.yaml`)
- No build tools or scripts
- No `.cursor/` or IDE files

This makes it perfect for static hosting services (GitHub Pages, Netlify, Vercel, etc.)

## Prerequisites

Before deploying, ensure:

- [ ] **FVM installed** - Flutter Version Management
- [ ] **Clean working tree** - All changes committed to `main`
- [ ] **Tests passing** - Run `fvm flutter test`
- [ ] **No linter errors** - Run `fvm dart analyze`
- [ ] **Code formatted** - Run `fvm dart format .`

## Versioning

Follows [Semantic Versioning](https://semver.org/):
- **MAJOR.MINOR.PATCH** (e.g., `1.2.3`)
- **MAJOR**: Breaking changes (1.0.0 → 2.0.0)
- **MINOR**: New features (1.0.0 → 1.1.0)
- **PATCH**: Bug fixes (1.0.0 → 1.0.1)

The script auto-increments the patch version if not specified.

## Command Options

```bash
# Show help
./scripts/deploy.sh --help

# Run self-tests
./scripts/deploy.sh --test

# Dry run (no changes)
./scripts/deploy.sh --dry-run

# Deploy with version
./scripts/deploy.sh 2.0.0
```

## Deployment Workflow

```
┌─────────────────────────────────────────────────────┐
│ 1. Developer commits to main branch                 │
└────────────────┬────────────────────────────────────┘
                 │
                 ▼
┌─────────────────────────────────────────────────────┐
│ 2. Run: ./scripts/deploy.sh                         │
└────────────────┬────────────────────────────────────┘
                 │
                 ▼
┌─────────────────────────────────────────────────────┐
│ 3. Script builds and deploys to deployment branch   │
│    - Only static files committed                    │
│    - Force push to deployment branch                │
└────────────────┬────────────────────────────────────┘
                 │
                 ▼
┌─────────────────────────────────────────────────────┐
│ 4. Hosting service rebuilds (automatic)             │
│    - GitHub Pages / Netlify / Vercel                │
└────────────────┬────────────────────────────────────┘
                 │
                 ▼
┌─────────────────────────────────────────────────────┐
│ 5. App is live! 🚀                                   │
└─────────────────────────────────────────────────────┘
```

## Hosting Setup

### GitHub Pages

1. Go to repository **Settings** → **Pages**
2. Source: **Deploy from a branch**
3. Branch: `deployment` / `/ (root)`
4. Save

URL: `https://<username>.github.io/<repository>/`

### Netlify

1. **New site from Git**
2. Branch: `deployment`
3. Build command: *(leave empty - pre-built)*
4. Publish directory: `/` *(root)*

### Vercel

1. **Import Git Repository**
2. Branch: `deployment`
3. Root Directory: `./`
4. Build command: *(leave empty)*

## Common Issues & Solutions

### "Working tree is dirty"

**Problem:** Uncommitted changes in repository

**Solution:**
```bash
git status
git add .
git commit -m "feat: your changes"
./scripts/deploy.sh
```

### "Flutter build failed"

**Problem:** Build errors in application

**Solution:**
```bash
# Clean and rebuild
fvm flutter clean
fvm flutter pub get
fvm flutter build web --release --wasm

# Check for errors
fvm dart analyze
```

### "FVM not found"

**Problem:** Flutter Version Management not installed

**Solution:**
```bash
# Install FVM
brew install fvm  # macOS
# or visit: https://fvm.app

# Install Flutter via FVM
fvm install
fvm use stable
```

### Permission Denied

**Problem:** Script not executable

**Solution:**
```bash
chmod +x scripts/deploy.sh
./scripts/deploy.sh
```

## Rollback Procedure

If deployment fails or has issues:

```bash
# 1. Switch to deployment branch
git checkout deployment

# 2. Reset to previous commit
git reset --hard HEAD~1

# 3. Force push
git push --force origin deployment

# 4. Return to main
git checkout main
```

## Testing Locally

Before deploying, test the build locally:

```bash
# Build the app with WebAssembly
fvm flutter build web --release --wasm

# Serve locally
cd build/web
python3 -m http.server 8000

# Open browser to http://localhost:8000
```

Test all critical functionality before deploying to production.

## Post-Deployment Checklist

After deployment, verify:

- [ ] **App loads** - Visit deployment URL
- [ ] **No console errors** - Check browser developer console
- [ ] **Assets load** - Images, fonts, icons display correctly
- [ ] **Routing works** - Test navigation between pages
- [ ] **Mobile responsive** - Test on mobile devices
- [ ] **Cross-browser** - Test on Chrome, Firefox, Safari

## Environment Variables

For production environment variables:

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

Set these in your hosting provider's dashboard, not in code.

## Security Notes

- ⚠️ **Never commit secrets** to any branch
- ⚠️ **Don't protect deployment branch** - needs force push
- ✅ **Protect main branch** - require pull requests
- ✅ **Use environment variables** for sensitive data

## Monitoring

After deployment, monitor:

- Page load times
- Browser console errors
- User-reported issues
- Hosting provider status

Consider setting up:
- Error tracking (Sentry, Crashlytics)
- Analytics (Google Analytics, Plausible)
- Performance monitoring (Lighthouse CI)

## Continuous Deployment

For automated deployments on git tags:

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
        run: ./scripts/deploy.sh ${{ github.ref_name }}
```

## Additional Resources

- **Deployment Rules**: `.cursor/rules/deployment.mdc`
- **Full Deployment Guide**: `README_DEPLOYMENT.md`
- **Deployment Script**: `scripts/deploy.sh`
- **Semantic Versioning**: https://semver.org/

## Examples

### Basic Deployment

```bash
# Auto-increment and deploy
./scripts/deploy.sh

# Output:
# 🚀 Starting deployment process...
# ℹ️ Current version: 1.0.0
# ℹ️ Auto-incremented version: 1.0.1
# 🔨 Building web app...
# ✅ Build completed successfully
# ✅ Deployment committed and pushed
# 🎉 Deployment successful!
```

### Version Bump

```bash
# Deploy major version
./scripts/deploy.sh 2.0.0

# Deploy minor version
./scripts/deploy.sh 1.1.0

# Deploy patch version
./scripts/deploy.sh 1.0.1
```

### Testing Before Deploy

```bash
# Dry run to see what would happen
./scripts/deploy.sh --dry-run

# Output shows all steps without making changes
# [DRY RUN] Would run: fvm flutter build web --release
# [DRY RUN] Would commit with message: chore(release): 1.0.1
```

## Summary

The deploy command provides a streamlined, automated way to deploy your Flutter web application. It handles all the complexity of building, packaging, and deploying your app to a clean, production-ready branch that's perfect for static hosting.

**Key Benefits:**
- 🚀 One command deployment
- 📦 Only static files deployed (no source code)
- 🔄 Automatic version management
- 🧪 Dry-run mode for testing
- 🔐 Secure by design (no secrets in repo)
- 📊 Works with all major hosting providers

For detailed documentation, see `.cursor/rules/deployment.mdc`

