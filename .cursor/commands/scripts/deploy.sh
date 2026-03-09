#!/usr/bin/env bash
set -euo pipefail

# Script metadata
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
readonly SCRIPT_DIR
SCRIPT_NAME="$(basename "${BASH_SOURCE[0]}")"
readonly SCRIPT_NAME
# Flutter app lives in shop/ (repo root is SCRIPT_DIR/../../..)
REPO_ROOT="$(cd "${SCRIPT_DIR}/../../.." && pwd)"
readonly REPO_ROOT
PROJECT_ROOT="${REPO_ROOT}/shop"
readonly PROJECT_ROOT

# Configuration
readonly DEPLOYMENT_BRANCH="deployment/shop"
readonly BUILD_DIR="build/web"
readonly PUBSPEC_FILE="pubspec.yaml"
DRY_RUN=0

# Color codes for output
readonly RED='\033[0;31m'
readonly GREEN='\033[0;32m'
readonly YELLOW='\033[1;33m'
readonly BLUE='\033[0;34m'
readonly NC='\033[0m' # No Color

# Logging functions with meaningful emojis
info() {
    echo -e "${BLUE}ℹ️  INFO:${NC} $*" >&2
}

success() {
    echo -e "${GREEN}✅ SUCCESS:${NC} $*" >&2
}

warn() {
    echo -e "${YELLOW}⚠️  WARNING:${NC} $*" >&2
}

error() {
    echo -e "${RED}❌ ERROR:${NC} $*" >&2
}

progress() {
    echo -e "${BLUE}➡️${NC} $*" >&2
}

build_info() {
    echo -e "${BLUE}🔨${NC} $*" >&2
}

rocket_launch() {
    echo -e "${GREEN}🚀${NC} $*" >&2
}

celebrate() {
    echo -e "${GREEN}🎉${NC} $*" >&2
}

# Error handler
die() {
    error "$*"
    exit 1
}

# Cleanup function
cleanup() {
    local exit_code=$?
    
    # Switch back to original branch if needed
    if [[ -n "${ORIGINAL_BRANCH:-}" ]]; then
        info "Switching back to ${ORIGINAL_BRANCH}"
        git checkout "${ORIGINAL_BRANCH}" &>/dev/null || true
    fi
    
    if [[ ${exit_code} -ne 0 ]]; then
        error "Deployment failed with exit code: ${exit_code}"
    fi
    
    exit "${exit_code}"
}

# Set trap for cleanup on exit
trap cleanup EXIT INT TERM

# Show help message
show_help() {
    cat <<EOF
${SCRIPT_NAME} - Deploy Flutter web app to deployment branch

USAGE:
    ${SCRIPT_NAME} [OPTIONS] [VERSION]

DESCRIPTION:
    Builds Flutter web app with WebAssembly and deploys to '${DEPLOYMENT_BRANCH}' branch.
    
    Steps:
    1. Build Flutter web app (fvm flutter build web --release --wasm)
    2. Switch to deployment branch
    3. Commit build artifacts with semantic versioning
    4. Push to remote repository

ARGUMENTS:
    VERSION         Version number (e.g., 1.2.3)
                    If not provided, auto-increments patch version

OPTIONS:
    -h, --help      Show this help message
    -n, --dry-run   Perform dry run without committing/pushing
    --test          Run self-tests

EXAMPLES:
    ${SCRIPT_NAME}                    # Auto-increment version
    ${SCRIPT_NAME} 1.2.3              # Deploy version 1.2.3
    ${SCRIPT_NAME} --dry-run          # Test without deploying

PREREQUISITES:
    - FVM (Flutter Version Management) installed
    - Git repository initialized
    - Clean working tree (commit changes first)
    - pubspec.yaml with version field

DEPLOYMENT BRANCH:
    Branch: ${DEPLOYMENT_BRANCH}
    Commit Format: chore(release): <version>
    
MORE INFO:
    See .cursor/skills/deployment/SKILL.md for detailed deployment guide

EOF
}

# Self-test function
test_script() {
    info "Running self-tests..."
    
    # Syntax check
    bash -n "${BASH_SOURCE[0]}" || die "Syntax check failed"
    
    # ShellCheck (if available)
    if command -v shellcheck &>/dev/null; then
        shellcheck -x "${BASH_SOURCE[0]}" || die "ShellCheck failed"
    else
        warn "shellcheck not found, skipping..."
    fi
    
    celebrate "All tests passed!"
}

# Check prerequisites
check_prerequisites() {
    progress "Checking prerequisites..."
    
    # Check if fvm is installed
    if ! command -v fvm &>/dev/null; then
        die "FVM not found. Install it first: https://fvm.app"
    fi
    
    # Check if Flutter is installed via FVM
    if ! fvm flutter --version &>/dev/null; then
        die "Flutter not found via FVM. Run: fvm install"
    fi
    
    # Check if git is installed
    if ! command -v git &>/dev/null; then
        die "Git not found. Install it first."
    fi
    
    # Check if we're in a git repository
    if ! git rev-parse --git-dir &>/dev/null; then
        die "Not in a git repository"
    fi
    
    # Check if pubspec.yaml exists
    if [[ ! -f "${PROJECT_ROOT}/${PUBSPEC_FILE}" ]]; then
        die "pubspec.yaml not found in project root"
    fi
    
    success "All prerequisites satisfied"
}

# Check if working tree is clean
check_working_tree() {
    progress "Checking working tree..."
    
    if ! git diff-index --quiet HEAD --; then
        die "Working tree is dirty. Commit or stash changes first."
    fi
    
    success "Working tree is clean"
}

# Get current version from pubspec.yaml
get_current_version() {
    local version
    version=$(grep -E '^version:' "${PROJECT_ROOT}/${PUBSPEC_FILE}" | sed 's/version: *//;s/+.*//')
    
    if [[ -z "${version}" ]]; then
        die "Could not extract version from ${PUBSPEC_FILE}"
    fi
    
    echo "${version}"
}

# Increment patch version
increment_patch_version() {
    local version="$1"
    local major minor patch
    
    # Parse version (format: MAJOR.MINOR.PATCH)
    if [[ "${version}" =~ ^([0-9]+)\.([0-9]+)\.([0-9]+)$ ]]; then
        major="${BASH_REMATCH[1]}"
        minor="${BASH_REMATCH[2]}"
        patch="${BASH_REMATCH[3]}"
        
        # Increment patch
        ((patch++))
        
        echo "${major}.${minor}.${patch}"
    else
        die "Invalid version format: ${version}. Expected: MAJOR.MINOR.PATCH"
    fi
}

# Validate version format
validate_version() {
    local version="$1"
    
    if ! [[ "${version}" =~ ^[0-9]+\.[0-9]+\.[0-9]+$ ]]; then
        die "Invalid version format: ${version}. Expected: MAJOR.MINOR.PATCH (e.g., 1.2.3)"
    fi
}

# Build Flutter web app
build_flutter_web() {
    progress "Building Flutter web app..."
    
    cd "${PROJECT_ROOT}" || die "Failed to change to project root"
    
    # Clean previous build
    build_info "Cleaning previous build..."
    if [[ ${DRY_RUN} -eq 0 ]]; then
        fvm flutter clean &>/dev/null || true
    else
        info "[DRY RUN] Would run: fvm flutter clean"
    fi
    
    # Build web app with WebAssembly
    build_info "Building web app with Wasm (this may take a few minutes)..."
    if [[ ${DRY_RUN} -eq 0 ]]; then
        if ! fvm flutter build web --release --wasm; then
            die "Flutter build failed"
        fi
    else
        info "[DRY RUN] Would run: fvm flutter build web --release --wasm"
    fi
    
    # Check if build directory exists
    if [[ ${DRY_RUN} -eq 0 ]]; then
        if [[ ! -d "${PROJECT_ROOT}/${BUILD_DIR}" ]]; then
            die "Build directory not found: ${BUILD_DIR}"
        fi
    fi
    
    success "Build completed successfully"
}

# Deploy to deployment branch (only build/web contents)
deploy_to_branch() {
    local version="$1"
    local timestamp
    timestamp="$(date '+%Y-%m-%d %H:%M:%S')"
    
    progress "Deploying to ${DEPLOYMENT_BRANCH} branch..."
    
    cd "${PROJECT_ROOT}" || die "Failed to change to project root"
    
    # Save current branch
    ORIGINAL_BRANCH="$(git branch --show-current)"
    info "Current branch: ${ORIGINAL_BRANCH}"
    
    # Check if deployment branch exists remotely
    local branch_exists_remote=0
    if git ls-remote --heads origin "${DEPLOYMENT_BRANCH}" | grep -q "${DEPLOYMENT_BRANCH}"; then
        branch_exists_remote=1
    fi
    
    # Create temporary directory for deployment
    local temp_deploy_dir
    temp_deploy_dir="$(mktemp -d)"
    info "Using temporary directory: ${temp_deploy_dir}"
    
    # Copy build contents to temp directory
    info "Copying build contents..."
    if [[ ${DRY_RUN} -eq 0 ]]; then
        cp -r "${PROJECT_ROOT}/${BUILD_DIR}/"* "${temp_deploy_dir}/" || die "Failed to copy build contents"
        
        # Also copy hidden files if any
        if compgen -G "${PROJECT_ROOT}/${BUILD_DIR}/.*" > /dev/null; then
            cp -r "${PROJECT_ROOT}/${BUILD_DIR}/".* "${temp_deploy_dir}/" 2>/dev/null || true
        fi
    else
        info "[DRY RUN] Would copy: ${PROJECT_ROOT}/${BUILD_DIR}/* to ${temp_deploy_dir}/"
    fi
    
    # Initialize git in temp directory or checkout deployment branch
    cd "${temp_deploy_dir}" || die "Failed to change to temp directory"
    
    if [[ ${DRY_RUN} -eq 0 ]]; then
        # Initialize git repo
        git init || die "Failed to initialize git"
        
        # Add remote
        local remote_url
        remote_url=$(cd "${PROJECT_ROOT}" && git config --get remote.origin.url)
        git remote add origin "${remote_url}" || die "Failed to add remote"
        
        # Fetch deployment branch if it exists
        if [[ ${branch_exists_remote} -eq 1 ]]; then
            info "Fetching existing ${DEPLOYMENT_BRANCH} branch..."
            git fetch origin "${DEPLOYMENT_BRANCH}" || die "Failed to fetch ${DEPLOYMENT_BRANCH}"
        fi
        
        # Create orphan branch (clean history)
        info "Creating deployment branch..."
        git checkout --orphan "${DEPLOYMENT_BRANCH}" || die "Failed to create orphan branch"
    else
        info "[DRY RUN] Would initialize git and create orphan branch ${DEPLOYMENT_BRANCH}"
    fi
    
    # Add all files
    info "Adding build artifacts..."
    if [[ ${DRY_RUN} -eq 0 ]]; then
        git add . || die "Failed to add files"
    else
        info "[DRY RUN] Would run: git add ."
    fi
    
    # Check if there are changes to commit
    if [[ ${DRY_RUN} -eq 0 ]]; then
        if git diff --cached --quiet 2>/dev/null; then
            warn "No changes to commit. Build may be identical to previous deployment."
        fi
    fi
    
    # Commit changes
    local commit_message="chore(release): ${version}

Deployed on ${timestamp}
Contains only production build artifacts
"
    
    info "Committing with message: chore(release): ${version}"
    if [[ ${DRY_RUN} -eq 0 ]]; then
        git commit -m "${commit_message}" || die "Failed to commit"
    else
        info "[DRY RUN] Would commit with message:"
        echo "${commit_message}"
    fi
    
    # Push to remote (force push since it's an orphan branch)
    info "Pushing to origin/${DEPLOYMENT_BRANCH}..."
    if [[ ${DRY_RUN} -eq 0 ]]; then
        git push --force origin "${DEPLOYMENT_BRANCH}" || die "Failed to push"
    else
        info "[DRY RUN] Would run: git push --force origin ${DEPLOYMENT_BRANCH}"
    fi
    
    # Cleanup temp directory
    cd "${PROJECT_ROOT}" || true
    if [[ ${DRY_RUN} -eq 0 ]]; then
        rm -rf "${temp_deploy_dir}"
    else
        info "[DRY RUN] Would remove: ${temp_deploy_dir}"
    fi
    
    success "Deployment committed and pushed (build contents only)"
}

# Parse arguments
parse_args() {
    local version=""
    
    while [[ $# -gt 0 ]]; do
        case "$1" in
            --test)
                test_script
                exit 0
                ;;
            --dry-run|-n)
                DRY_RUN=1
                info "🧪 DRY RUN MODE - No changes will be made"
                shift
                ;;
            --help|-h)
                show_help
                exit 0
                ;;
            -*)
                die "Unknown option: $1"
                ;;
            *)
                version="$1"
                shift
                ;;
        esac
    done
    
    echo "${version}"
}

# Main function
main() {
    rocket_launch "Starting deployment process..."

    # Run from repo root so git and paths are correct
    cd "${REPO_ROOT}" || die "Failed to change to repo root"
    info "Project (Flutter app): ${PROJECT_ROOT}"

    # Parse arguments
    local provided_version
    provided_version=$(parse_args "$@")
    
    # Check prerequisites
    check_prerequisites
    check_working_tree
    
    # Determine version
    local current_version
    current_version=$(get_current_version)
    info "Current version in pubspec.yaml: ${current_version}"
    
    local deploy_version
    if [[ -n "${provided_version}" ]]; then
        validate_version "${provided_version}"
        deploy_version="${provided_version}"
        info "Using provided version: ${deploy_version}"
    else
        deploy_version=$(increment_patch_version "${current_version}")
        info "Auto-incremented version: ${deploy_version}"
    fi
    
    # Build Flutter web app
    build_flutter_web
    
    # Deploy to branch
    deploy_to_branch "${deploy_version}"
    
    # Success message
    echo ""
    celebrate "Deployment successful! 🎉"
    info "Version: ${deploy_version}"
    info "Branch: ${DEPLOYMENT_BRANCH}"
    
    if [[ ${DRY_RUN} -eq 1 ]]; then
        warn "This was a DRY RUN - no actual changes were made"
    else
        info "Your app should be live shortly once the hosting provider rebuilds"
    fi
}

# Run main only if executed directly (not sourced)
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi

