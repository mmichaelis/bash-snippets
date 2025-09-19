#!/usr/bin/env bash
### ============================================================================
###
### Bash Snippet: need
###
### Description:
###   A boilerplate script for creating new bash snippets.
###
### Notes:
###   - Includes robust error handling and debugging options.
###   - Use `DEBUG=2 <command>.sh <file>` to enable verbose debug
###     output. DEBUG=1 can be used for less verbose output, like in
###     dedicated `debug` output sections.
###
### ============================================================================

### ----------------------------------------------------------------------------
### Boilerplate
### ----------------------------------------------------------------------------

declare -ri DEBUG=${DEBUG:-0}

set -o errexit  # abort on nonzero exit status
set -o nounset  # abort on unbound variable
set -o pipefail # don't hide errors within pipes
### Call with `DEBUG=2 <command>.sh <file>` to enable verbose debug output
if ((DEBUG > 1)); then
  set -o xtrace # show expanded commands
else
  set +o xtrace # do not show expanded commands
fi

### ----------------------------------------------------------------------------
### The Snippet
### ----------------------------------------------------------------------------

# Check if a required command is available in PATH.
# Usage: need <command>
# Exits with error code 2 if the command is not found.
need() {
  command -v "$1" >/dev/null 2>&1 || { printf >&2 "Required command '%s' not found in PATH\n" "$1"; exit 2; }
}

### ----------------------------------------------------------------------------
### Example Usage
### ----------------------------------------------------------------------------

need git
need curl
need jq
