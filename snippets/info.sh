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
###   - If stderr is a terminal and `tput` is available, the "[INFO]" prefix is
###     colored blue for better visibility.
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

info() {
  # Check if stderr is a terminal and tput is available
  if [[ -t 2 ]] && command -v tput &>/dev/null; then
    local BLUE
    local RESET
    BLUE="$(tput setaf 4)"
    RESET="$(tput sgr0)"
    printf >&2 '[%sINFO%s] %s\n' "${BLUE}" "${RESET}" "$*"
  else
    printf >&2 '[INFO] %s\n' "$*"
  fi
}

### ----------------------------------------------------------------------------
### Example Usage
### ----------------------------------------------------------------------------

info "Hello ${USER}!"
