#!/usr/bin/env bash
set -euo pipefail

# Script metadata
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
readonly SCRIPT_DIR
SCRIPT_NAME="$(basename "${BASH_SOURCE[0]}")"
readonly SCRIPT_NAME
# API (Dart Frog) lives in api/ (repo root is SCRIPT_DIR/../../..)
REPO_ROOT="$(cd "${SCRIPT_DIR}/../../.." && pwd)"
readonly REPO_ROOT
PROJECT_ROOT="${REPO_ROOT}/api"
readonly PROJECT_ROOT

# Configuration
readonly GCLOUD_SERVICE="tungbach"
readonly GCLOUD_PROJECT="tung-bach-cos"
readonly GCLOUD_REGION="asia-southeast3"
readonly BUILD_DIR="build"
DRY_RUN=0

# Color codes for output
readonly RED='\033[0;31m'
readonly GREEN='\033[0;32m'
readonly YELLOW='\033[1;33m'
readonly BLUE='\033[0;34m'
readonly NC='\033[0m' # No Color

# Logging
info() { echo -e "${BLUE}ℹ️  INFO:${NC} $*" >&2; }
success() { echo -e "${GREEN}✅ SUCCESS:${NC} $*" >&2; }
warn() { echo -e "${YELLOW}⚠️  WARNING:${NC} $*" >&2; }
error() { echo -e "${RED}❌ ERROR:${NC} $*" >&2; }
progress() { echo -e "${BLUE}➡️${NC} $*" >&2; }
build_info() { echo -e "${BLUE}🔨${NC} $*" >&2; }
rocket_launch() { echo -e "${GREEN}🚀${NC} $*" >&2; }
celebrate() { echo -e "${GREEN}🎉${NC} $*" >&2; }

die() {
    error "$*"
    exit 1
}

# Show help
show_help() {
    cat <<EOF
${SCRIPT_NAME} - Build Dart Frog API and deploy to Google Cloud Run

USAGE:
    ${SCRIPT_NAME} [OPTIONS]

DESCRIPTION:
    Builds the Dart Frog app in api/ with \`dart_frog build\` and deploys
    to Google Cloud Run (service: ${GCLOUD_SERVICE}, project: ${GCLOUD_PROJECT}).

    Steps:
    1. Run \`dart_frog build\` in api/
    2. Run \`gcloud run deploy\` with --source build

OPTIONS:
    -h, --help      Show this help message
    -n, --dry-run   Print commands only, do not build or deploy

PREREQUISITES:
    - Dart SDK and dart_frog_cli installed
    - gcloud CLI installed and authenticated
    - Project ${GCLOUD_PROJECT} with Cloud Run enabled

MORE INFO:
    See .cursor/skills/api-deployment-guidelines/SKILL.md for detailed deployment guide

EXAMPLES:
    ${SCRIPT_NAME}              # Build and deploy
    ${SCRIPT_NAME} --dry-run    # Show what would run

EOF
}

# Check prerequisites
check_prerequisites() {
    progress "Checking prerequisites..."

    if ! command -v dart_frog &>/dev/null; then
        die "dart_frog not found. Install: dart pub global activate dart_frog_cli"
    fi

    if ! command -v gcloud &>/dev/null; then
        die "gcloud CLI not found. Install: https://cloud.google.com/sdk/docs/install"
    fi

    if [[ ! -d "${PROJECT_ROOT}" ]]; then
        die "API project not found: ${PROJECT_ROOT}"
    fi

    if [[ ! -f "${PROJECT_ROOT}/pubspec.yaml" ]]; then
        die "pubspec.yaml not found in ${PROJECT_ROOT}"
    fi

    success "All prerequisites satisfied"
}

# Build Dart Frog app
build_dart_frog() {
    progress "Building Dart Frog app..."
    cd "${PROJECT_ROOT}" || die "Failed to change to ${PROJECT_ROOT}"

    if [[ ${DRY_RUN} -eq 1 ]]; then
        info "[DRY RUN] Would run: dart_frog build"
        return 0
    fi

    build_info "Running dart_frog build..."
    if ! dart_frog build; then
        die "dart_frog build failed"
    fi

    if [[ ! -d "${PROJECT_ROOT}/${BUILD_DIR}" ]]; then
        die "Build directory not found: ${PROJECT_ROOT}/${BUILD_DIR}"
    fi

    success "Build completed successfully"
}

# Deploy to Cloud Run
deploy_cloud_run() {
    progress "Deploying to Cloud Run..."
    cd "${PROJECT_ROOT}" || die "Failed to change to ${PROJECT_ROOT}"

    if [[ ${DRY_RUN} -eq 1 ]]; then
        info "[DRY RUN] Would run: gcloud run deploy ${GCLOUD_SERVICE} --source ${BUILD_DIR} --project=${GCLOUD_PROJECT} --region=${GCLOUD_REGION} --allow-unauthenticated"
        return 0
    fi

    build_info "Running gcloud run deploy..."
    if ! gcloud run deploy "${GCLOUD_SERVICE}" \
        --source "${BUILD_DIR}" \
        --project="${GCLOUD_PROJECT}" \
        --region="${GCLOUD_REGION}" \
        --allow-unauthenticated; then
        die "gcloud run deploy failed"
    fi

    success "Deployed to Cloud Run"
}

# Parse arguments
parse_args() {
    while [[ $# -gt 0 ]]; do
        case "$1" in
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
                die "Unexpected argument: $1"
                ;;
        esac
    done
}

# Main
main() {
    rocket_launch "Starting API deployment process..."
    cd "${REPO_ROOT}" || die "Failed to change to repo root"
    info "API project: ${PROJECT_ROOT}"

    parse_args "$@"
    check_prerequisites
    build_dart_frog
    deploy_cloud_run

    echo ""
    celebrate "Deployment successful! 🎉"
    info "Service: ${GCLOUD_SERVICE}"
    info "Project: ${GCLOUD_PROJECT}"
    info "Region: ${GCLOUD_REGION}"

    if [[ ${DRY_RUN} -eq 1 ]]; then
        warn "This was a DRY RUN - no actual changes were made"
    fi
}

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
