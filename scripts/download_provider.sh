#!/usr/bin/env bash

set -exuo pipefail

PROVIDER_NAME="$1"
PROVIDER_VERSION="$2"
PROVIDER_CHECKSUM="$3"

OS="linux"
ARCH="${OS}_amd64"

PLUGIN_DIR="${HOME}/.terraform.d/plugins/${ARCH}"
PLUGIN_PATH="${PLUGIN_DIR}/terraform-provider-${PROVIDER_NAME}"

PROVIDER_URL="https://github.com/akerl/terraform-provider-${PROVIDER_NAME}/releases/download/${PROVIDER_VERSION}/terraform-provider-${PROVIDER_NAME}_${OS}"

mkdir -p "${PLUGIN_DIR}"

curl -sLo "${PLUGIN_PATH}" "${PROVIDER_URL}"

ACTUAL_CHECKSUM="$(shasum -a 256 "${PLUGIN_PATH}" | cut -d' ' -f1)"

[[ "${ACTUAL_CHECKSUM}" != "${PROVIDER_CHECKSUM}" ]] && \
    echo 'Checksum mismatch' && \
    exit 1

chmod a+x "${PLUGIN_PATH}"

