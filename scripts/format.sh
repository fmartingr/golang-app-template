#!/usr/bin/env bash
set -e

if [ -z "$FROM_MAKEFILE" ]; then
    echo "Do not call this file directly - use the make command"
    exit 1
fi

# Enable/Disable formatters
GOFMT_ENABLED=${GOFMT_ENABLED:-y}

# Add go binaries path to current $PATH
PATH=$PATH:$(go env GOPATH)/bin

files=$(find . -name '*.go')

for file in $files
do
    if [ "$GOFMT_ENABLED" == "y" ]; then
        gofmt -w -s $file
    fi
done
