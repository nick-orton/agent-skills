#!/bin/sh
# mdlint.sh — Markdown line-length linter
#
# Wraps pymarkdownlnt (MD013) to enforce an 80-character line limit on
# prose. Code blocks (fenced and indented) are explicitly exempt.
#
# Usage: bash scripts/mdlint.sh <file.md> [<file.md> ...]
# Exit:  0 = clean, 1 = violations found, 2 = usage/setup error

set -e

if [ $# -eq 0 ]; then
    echo "Usage: $0 <file.md> [<file.md> ...]" >&2
    exit 2
fi

# Install pymarkdownlnt if the CLI is not available
if ! command -v pymarkdown > /dev/null 2>&1; then
    echo "pymarkdownlnt not found — installing..." >&2
    pip install pymarkdownlnt --quiet
fi

exec pymarkdown \
    --enable-extensions front-matter \
    --set "plugins.md013.line_length=80" \
    --set "plugins.md013.code_blocks=false" \
    scan "$@"
