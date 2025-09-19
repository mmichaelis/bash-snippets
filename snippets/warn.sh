#!/usr/bin/env bash
### ============================================================================
###
### Bash Snippet: warn
###
### Description:
###   Outputs warning messages to stderr.
###
### Usage:
###   warn <message>
###   Outputs the specified <message> prefixed with "[WARN] ".
###
### Notes:
###   - Always redirects output to stderr to separate from normal output.
###   - If stderr is a terminal and `tput` is available, the "[WARN]" prefix is
###     colored yellow for better visibility.
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

warn() {
  # Check if stderr is a terminal and tput is available
  if [[ -t 2 ]] && command -v tput &>/dev/null; then
    local YELLOW
    local RESET
    YELLOW="$(tput setaf 3)"
    RESET="$(tput sgr0)"
    printf >&2 '[%sWARN%s] %s\n' "${YELLOW}" "${RESET}" "$*"
  else
    printf >&2 '[WARN] %s\n' "$*"
  fi
}

### ----------------------------------------------------------------------------
### Example Usage
### ----------------------------------------------------------------------------

warn "Attention, ${USER}!"
