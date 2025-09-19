#!/usr/bin/env bash
### ============================================================================
###
### Bash Snippet: boilerplate
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
