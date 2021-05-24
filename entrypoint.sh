#!/bin/sh

set -e

curl -XPOST -u "${INPUT_USER}:${INPUT_PAT}" \
     -H "Accept: application/vnd.github.everest-preview+json" \
     -H "Content-Type: application/json" \
     "https://api.github.com/repos/${INPUT_OWNER}/${INPUT_REPO}/actions/workflows/${INPUT_WORKFLOW}/dispatches" \
     --data '{"ref": "master"}'
