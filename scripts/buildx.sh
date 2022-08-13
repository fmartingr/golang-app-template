#!/usr/bin/env bash
set -ex

if [ -z "$FROM_MAKEFILE" ]; then
    echo "Do not call this file directly - use the make command"
    exit 1
fi

CONTAINER_RUNTIME=docker # Forcing docker

if [ "$CONTAINER_RUNTIME" == "docker" ]; then
    $CONTAINER_RUNTIME buildx create --use --name ${PROJECT_NAME}_builder
fi

cp -r dist/${PROJECT_NAME}_linux_arm_7 dist/${PROJECT_NAME}_linux_armv7
cp -r dist/${PROJECT_NAME}_linux_amd64_v1 dist/${PROJECT_NAME}_linux_amd64

$CONTAINER_RUNTIME buildx build \
    -f ${CONTAINERFILE_NAME} \
    --platform=${BUILDX_PLATFORMS} \
    --build-arg "ALPINE_VERSION=${CONTAINER_ALPINE_VERSION}" \
    --build-arg "BIN_NAME=${CONTAINER_BIN_NAME}" \
    --build-arg "SOURCE_URL=${CONTAINER_SOURCE_URL}" \
    --build-arg "MAINTAINER=${CONTAINER_MAINTAINER}" \
    ${CONTAINER_BUILDX_OPTIONS} .

if [ "$CONTAINER_RUNTIME" == "docker" ]; then
    $CONTAINER_RUNTIME buildx rm ${PROJECT_NAME}_builder
fi
