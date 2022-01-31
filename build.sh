#!/bin/sh

set -e

# Arguments: $1 CYPRESS_VERSION
build() {
  docker build \
    --build-arg CYPRESS_VERSION="${1}" \
    -t phase2/cypress:"${1}" \
    .
}

build "4.12.1"
