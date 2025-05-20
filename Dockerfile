# Stage 1: Use Alpine to install gettext (for envsubst)
FROM alpine:3.19 as tools
RUN apk add --no-cache gettext

# Stage 2: Pull official Tempo image
FROM grafana/tempo:latest as tempo-base

# Stage 3: Final image: Alpine + Tempo + gettext
FROM alpine:3.19

USER root

# Copy tempo binary and busybox shell
COPY --from=tempo-base /tempo /tempo
COPY --from=tempo-base /busybox /busybox

# Copy envsubst (gettext tool)
COPY --from=tools /usr/bin/envsubst /usr/bin/envsubst

# Set env
ENV PATH="/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/busybox"

# Add CA certs if needed
RUN apk add --no-cache ca-certificates

RUN apk add --no-cache gettext

# Copy the configuration file
COPY tempo.yaml /etc/tempo.yaml

# Expose the necessary ports
EXPOSE 3200
EXPOSE 4317

ENTRYPOINT ["/bin/sh", "-c", "envsubst < /etc/tempo.yaml > /tmp/tempo.yaml && exec /tempo -config.file=/tmp/tempo.yaml"]
