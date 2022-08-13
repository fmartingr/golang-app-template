# Build stage
ARG ALPINE_VERSION

FROM docker.io/library/alpine:${ALPINE_VERSION} AS builder
ARG TARGETARCH
ARG TARGETOS
ARG TARGETVARIANT
ARG BIN_NAME
COPY dist/${BIN_NAME}_${TARGETOS}_${TARGETARCH}${TARGETVARIANT}/${BIN_NAME} /usr/bin/${BIN_NAME}
RUN apk add --no-cache ca-certificates tzdata && \
    chmod +x /usr/bin/${BIN_NAME}

# Server image
FROM scratch
ARG BIN_NAME
ARG SOURCE_URL
ARG MAINTAINER

ENV PORT 8080
LABEL org.opencontainers.image.source="${SOURCE_URL}"
LABEL maintainer="${MAINTAINER}"

COPY --from=builder /usr/bin/${BIN_NAME} /usr/bin/${BIN_NAME}
COPY --from=builder /usr/share/zoneinfo /usr/share/zoneinfo
COPY --from=builder /etc/ssl/certs/ca-certificates.crt /etc/ssl/certs/ca-certificates.crt

ENTRYPOINT ["/usr/bin/${BIN_NAME}"]
