# Deploy Command

> Deploy Flutter web application to production

## Quick Usage

Run from the **repository root** (the script deploys the app in `shop/`):

```bash
# Auto-increment version (1.0.0 → 1.0.1)
./.cursor/commands/scripts/deploy-shop.sh

# Deploy specific version
./.cursor/commands/scripts/deploy-shop.sh 1.2.3

# Test without deploying
./.cursor/commands/scripts/deploy-shop.sh --dry-run
```

## What This Command Does

The deploy command automates the entire Flutter web deployment process for the **shop** app (`shop/`):

1. **Validates environment** - Checks FVM, Flutter, Git, and working tree (from repo root)
2. **Builds production app** - Runs `fvm flutter build web --release --wasm` in `shop/`
3. **Creates clean deployment** - Copies only `shop/build/web/` contents to temporary directory
4. **Commits to deployment branch** - Creates orphan branch with only static files
5. **Pushes to remote** - Force pushes to `deployment/shop` branch
6. **Cleans up** - Removes temporary files and returns to original branch

## Deployment Branch

The `deployment/shop` branch contains **only** production build artifacts:

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
- [ ] **Tests passing** - From `shop/`: `fvm flutter test`
- [ ] **No linter errors** - From `shop/`: `fvm dart analyze`
- [ ] **Code formatted** - From `shop/`: `fvm dart format .`

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
./.cursor/commands/scripts/deploy-shop.sh --help

# Run self-tests
./.cursor/commands/scripts/deploy-shop.sh --test

# Dry run (no changes)
./.cursor/commands/scripts/deploy-shop.sh --dry-run

# Deploy with version
./.cursor/commands/scripts/deploy-shop.sh 2.0.0
```

## Deployment Workflow

```
┌─────────────────────────────────────────────────────┐
│ 1. Developer commits to main branch                 │
└────────────────┬────────────────────────────────────┘
                 │
                 ▼
┌─────────────────────────────────────────────────────┐
│ 2. From repo root: ./.cursor/commands/scripts/      │
│    deploy-shop.sh (builds shop/ → deployment/shop)  │
└────────────────┬────────────────────────────────────┘
                 │
                 ▼
┌─────────────────────────────────────────────────────┐
│ 3. Script builds and deploys to deployment/shop     │
│    - Only static files committed                    │
│    - Force push to deployment/shop branch           │
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
3. Branch: `deployment/shop` / `/ (root)`
4. Save

URL: `https://<username>.github.io/<repository>/`

### Netlify

1. **New site from Git**
2. Branch: `deployment/shop`
3. Build command: *(leave empty - pre-built)*
4. Publish directory: `/` *(root)*

### Vercel

1. **Import Git Repository**
2. Branch: `deployment/shop`
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
./.cursor/commands/scripts/deploy-shop.sh
```

### "Flutter build failed"

**Problem:** Build errors in application

**Solution:**
```bash
cd shop
fvm flutter clean
fvm flutter pub get
fvm flutter build web --release --wasm
fvm dart analyze
cd ..
```

### "FVM not found"

**Problem:** Flutter Version Management not installed

**Solution:**
```bash
# Install FVM
brew install fvm  # macOS
# or visit: https://fvm.app

# Install Flutter via FVM (from repo root or shop/)
fvm install
fvm use stable
```

### Permission Denied

**Problem:** Script not executable

**Solution:** (from repo root)
```bash
chmod +x .cursor/commands/scripts/deploy-shop.sh
./.cursor/commands/scripts/deploy-shop.sh
```

## Rollback Procedure

If deployment fails or has issues:

```bash
# 1. Switch to deployment branch
git checkout deployment/shop

# 2. Reset to previous commit
git reset --hard HEAD~1

# 3. Force push
git push --force origin deployment/shop

# 4. Return to main
git checkout main
```

## Testing Locally

Before deploying, test the build locally from the **shop** app:

```bash
cd shop
fvm flutter build web --release --wasm
cd build/web
python3 -m http.server 8000
# Open browser to http://localhost:8000
cd ../..
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
- ⚠️ **Don't protect deployment/shop branch** - needs force push
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
        run: ./.cursor/commands/scripts/deploy-shop.sh ${{ github.ref_name }}
```

## Additional Resources

- **Deployment Rules**: `.cursor/rules/deployment.mdc`
- **Deployment guidelines (skill)**: `.cursor/skills/shop-deployment-guidelines/SKILL.md`
- **Deployment Script**: `.cursor/commands/scripts/deploy-shop.sh`
- **Semantic Versioning**: https://semver.org/

## Examples

### Basic Deployment

```bash
# From repo root: auto-increment and deploy (shop app)
./.cursor/commands/scripts/deploy-shop.sh

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
# From repo root
./.cursor/commands/scripts/deploy-shop.sh 2.0.0
./.cursor/commands/scripts/deploy-shop.sh 1.1.0
./.cursor/commands/scripts/deploy-shop.sh 1.0.1
```

### Testing Before Deploy

```bash
# Dry run to see what would happen (from repo root)
./.cursor/commands/scripts/deploy-shop.sh --dry-run

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
