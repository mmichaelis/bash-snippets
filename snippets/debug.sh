#!/usr/bin/env bash
### ============================================================================
###
### Bash Snippet: debug
###
### Description:
###   Outputs debug messages to stderr.
###
### Usage:
###   debug <message>
###   Outputs the specified <message> prefixed with "[DEBUG] ".
###
### Notes:
###   - Always redirects output to stderr to separate from normal output.
###   - If stderr is a terminal and `tput` is available, the "[DEBUG]" prefix is
###     colored gray for better visibility.
###
### ============================================================================

### ----------------------------------------------------------------------------
### Boilerplate
### ----------------------------------------------------------------------------

# Not readonly, so it can be changed for testing/debugging within this script.
declare -i DEBUG=${DEBUG:-0}

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

debug() {
  if ((DEBUG < 1)); then
    return
  fi

  # Check if stderr is a terminal and tput is available
  if [[ -t 2 ]] && command -v tput &>/dev/null; then
    local GRAY
    local RESET
    GRAY="$(tput setaf 8)"
    RESET="$(tput sgr0)"
    printf >&2 '[%sDEBUG%s] %s\n' "${GRAY}" "${RESET}" "$*"
  else
    printf >&2 '[DEBUG] %s\n' "$*"
  fi
}

### ----------------------------------------------------------------------------
### Example Usage
### ----------------------------------------------------------------------------

debug "Only printed, when called with DEBUG=1 or DEBUG=2."

# Using sub shell to enforce DEBUG=1 for a single command (and to
# avoid conflicts with the DEBUG variable of this script).
( DEBUG=1 debug "Enforced debugging output. Invoke with DEBUG=1 to see all debugging output." )
