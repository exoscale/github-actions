#!/bin/bash
set -e -o pipefail
SCRIPT="${0##*/}"
trap "echo 'ERROR[${SCRIPT}]: Internal error' >&2" ERR

# git config
# REFS:
# - https://docs.github.com/en/actions/reference/environment-variables
# - https://docs.github.com/en/actions/reference/authentication-in-a-workflow

# (user)
if [ -n "${GITHUB_TOKEN}" ]; then
  gh_user="$(curl -s -H "Authorization: token ${GITHUB_TOKEN}" "https://api.github.com/users/${GITHUB_ACTOR}")"
  git config --global user.name "$(printf '%s' "${gh_user}" | jq -re .name)"
  git config --global user.email "$(printf '%s' "${gh_user}" | jq -re .email)"
fi

# Run command
exec "${@}"
