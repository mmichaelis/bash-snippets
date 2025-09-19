#!/usr/bin/env bash
### ============================================================================
###
### Bash Snippet: info
###
### Description:
###   Outputs informational messages to stderr.
###
### Usage:
###   info <message>
###   Outputs the specified <message> prefixed with "[INFO] ".
###
### Notes:
###   - Always redirects output to stderr to separate from normal output.
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

info() { printf >&2 '[INFO] %s\n' "$*"; }

### ----------------------------------------------------------------------------
### Example Usage
### ----------------------------------------------------------------------------

info "Hello ${USER}!"
