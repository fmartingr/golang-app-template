#!/usr/bin/env bash
set -e

if [ -z "$FROM_MAKEFILE" ]; then
    echo "Do not call this file directly - use the make command"
    exit 1
fi

golangci-lint run --tests=false
