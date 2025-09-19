#!/usr/bin/env bash
### ============================================================================
###
### Bash Snippet: err
###
### Description:
###   Outputs error messages to stderr.
###
### Usage:
###   err <message>
###   Outputs the specified <message> prefixed with "[ERROR] ".
###
### Notes:
###   - Always redirects output to stderr to separate from normal output.
###   - If stderr is a terminal and `tput` is available, the "[ERROR]" prefix is
###     colored red for better visibility.
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

err() {
  # Check if stderr is a terminal and tput is available
  if [[ -t 2 ]] && command -v tput &>/dev/null; then
    local RED
    local RESET
    RED="$(tput setaf 1)"
    RESET="$(tput sgr0)"
    printf >&2 '[%sERROR%s] %s\n' "${RED}" "${RESET}" "$*"
  else
    printf >&2 '[ERROR] %s\n' "$*"
  fi
}

### ----------------------------------------------------------------------------
### Example Usage
### ----------------------------------------------------------------------------

err "We failed, ${USER}!"
