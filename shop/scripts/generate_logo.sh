#!/usr/bin/env bash
#
# Script Name: generate_logo.sh
# Description: Generates app icons and launch screens from source images using flutter_launcher_icons
# Version: 1.0.0
#
# Usage: ./generate_logo.sh [OPTIONS]
#
# Options:
#   -h, --help          Show this help message
#   -v, --verbose       Enable verbose output
#   -d, --dry-run       Show what would be done without executing
#   --test              Run self-tests
#
# Dependencies:
#   - fvm (Flutter Version Management)
#   - flutter_launcher_icons package in pubspec.yaml
#
# Example:
#   ./generate_logo.sh
#   ./generate_logo.sh --dry-run
#

set -euo pipefail

# Script metadata
# Declare and assign separately to avoid masking return values (SC2155)
_script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
_script_name="$(basename "${BASH_SOURCE[0]}")"
_project_root="$(cd "${_script_dir}/.." && pwd)"

readonly SCRIPT_DIR="${_script_dir}"
readonly SCRIPT_NAME="${_script_name}"
readonly PROJECT_ROOT="${_project_root}"

# Configuration
VERBOSE=0
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

verbose() {
    if [[ ${VERBOSE} -eq 1 ]]; then
        echo -e "${BLUE}🔍 DEBUG:${NC} $*" >&2
    fi
}

# Error handler
die() {
    error "$*"
    exit 1
}

# Show help message
show_help() {
    cat <<EOF
Usage: ${SCRIPT_NAME} [OPTIONS]

Generates app icons and launch screens from source images using flutter_launcher_icons.

Options:
    -h, --help          Show this help message
    -v, --verbose       Enable verbose output
    -d, --dry-run       Show what would be done without executing
    --test              Run self-tests

Dependencies:
    - fvm (Flutter Version Management)
    - flutter_launcher_icons package in pubspec.yaml

Examples:
    ${SCRIPT_NAME}
    ${SCRIPT_NAME} --dry-run
    ${SCRIPT_NAME} --verbose

EOF
}

# Check if required commands exist
check_prerequisites() {
    verbose "Checking prerequisites..."
    
    # Check if fvm is installed
    if ! command -v fvm &> /dev/null; then
        die "fvm (Flutter Version Management) is not installed. Install it from: https://fvm.app/"
    fi
    verbose "✓ fvm is installed"
    
    # Check if we're in a Flutter project
    if [[ ! -f "${PROJECT_ROOT}/pubspec.yaml" ]]; then
        die "pubspec.yaml not found in project root: ${PROJECT_ROOT}"
    fi
    verbose "✓ pubspec.yaml found"
    
    # Check if flutter_launcher_icons is in dependencies
    if ! grep -q "flutter_launcher_icons:" "${PROJECT_ROOT}/pubspec.yaml"; then
        warn "flutter_launcher_icons not found in pubspec.yaml"
        warn "Add it to dev_dependencies:"
        warn "  dev_dependencies:"
        warn "    flutter_launcher_icons: ^0.13.1"
        die "Missing flutter_launcher_icons package"
    fi
    verbose "✓ flutter_launcher_icons package found in pubspec.yaml"
    
    success "All prerequisites met"
}

# Generate icons
generate_icons() {
    info "Generating app icons and launch screens..."
    
    # Change to project root
    cd "${PROJECT_ROOT}" || die "Failed to change to project root"
    verbose "Working directory: ${PROJECT_ROOT}"
    
    if [[ ${DRY_RUN} -eq 1 ]]; then
        info "[DRY RUN] Would execute: fvm dart run flutter_launcher_icons"
        return 0
    fi
    
    # Run flutter_launcher_icons
    # Note: Using 'dart run' instead of deprecated 'flutter pub run'
    local output
    if output=$(fvm dart run flutter_launcher_icons 2>&1); then
        success "Icons generated successfully!"
        if [[ ${VERBOSE} -eq 1 ]]; then
            echo "${output}" >&2
        fi
    else
        error "Failed to generate icons"
        echo "${output}" >&2
        return 1
    fi
}

# Self-test function
test_script() {
    info "Running self-tests..."
    
    # Syntax check
    if bash -n "${BASH_SOURCE[0]}"; then
        success "✓ Syntax check passed"
    else
        die "Syntax check failed"
    fi
    
    # ShellCheck (if available)
    if command -v shellcheck &> /dev/null; then
        if shellcheck -x "${BASH_SOURCE[0]}"; then
            success "✓ ShellCheck passed"
        else
            die "ShellCheck failed"
        fi
    else
        warn "shellcheck not found, skipping ShellCheck validation"
        info "Install shellcheck for better script validation:"
        info "  brew install shellcheck"
    fi
    
    success "All tests passed!"
}

# Parse command-line arguments
parse_args() {
    while [[ $# -gt 0 ]]; do
        case "$1" in
            --test)
                test_script
                exit 0
                ;;
            -h|--help)
                show_help
                exit 0
                ;;
            -v|--verbose)
                VERBOSE=1
                shift
                ;;
            -d|--dry-run)
                DRY_RUN=1
                shift
                ;;
            *)
                die "Unknown option: $1. Use --help for usage information."
                ;;
        esac
    done
}

# Main function
main() {
    parse_args "$@"
    
    info "🎨 App Icon Generator"
    echo "" >&2
    
    check_prerequisites
    generate_icons
    
    echo "" >&2
    success "🎉 Done!"
}

# Run main only if executed directly (not sourced)
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
