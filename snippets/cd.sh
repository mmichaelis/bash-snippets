#!/usr/bin/env bash
### ============================================================================
###
### Bash Snippet: cd
###
### Description:
###   A robust implementation of `cd` that avoids issues with CDPATH and
###   suppresses any output. It also ensures that the builtin `cd` is used and
###   exits on failure.
###
### Usage:
###   cd <directory>
###   Changes the current directory to <directory> without any output.
###
### Notes:
###   - This snippet unsets CDPATH to prevent unexpected directory changes.
###   - It overrides the `cd` command to suppress any output and ensure the
###     builtin is used.
###   - It exits with an error message if changing the directory fails.
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

# Disable CDPATH to avoid unexpected directory changes and output.
# Use `unset CDPATH || true` to avoid errors in case CDPATH is not set.
unset CDPATH || true

# Override cd to suppress any output (stdout/stderr) to guard against
# environments that emit directory names (e.g., due to CDPATH or shell
# customization). Always use the builtin and exit on failure.
cd() {
	builtin cd "$@" >/dev/null 2>&1 || { printf 'ERROR: Failed to change directory to %s\n' "$*" >&2; exit 1; }
}

### ----------------------------------------------------------------------------
### Example Usage
### ----------------------------------------------------------------------------

cd "$@"

### Output the current directory for verification, because we cannot change
### the directory of the parent shell.

printf 'Current directory: %s\n' "$(pwd)"
