#!/usr/bin/env bash
set -e

if [ -z "$FROM_MAKEFILE" ]; then
    echo "Do not call this file directly - use the make command"
    exit 1
fi

COVERAGE_PATH=coverage.out
COVERAGE_HTML_PATH=coverage.html
CGO_ENABLED=1 # Used for -race

go test ${TEST_OPTIONS} ${SOURCE_FILES} -timeout=${TEST_TIMEOUT}

echo
echo "== Coverage report =="
echo

go tool cover -html=${COVERAGE_PATH} -o ${COVERAGE_HTML_PATH}
go tool cover -func=${COVERAGE_PATH}
