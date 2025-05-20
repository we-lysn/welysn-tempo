#!/bin/sh
# Replace env vars in tempo.yaml and start Tempo

envsubst < /etc/tempo.yaml
exec /usr/bin/tempo -config.file=//tempo.yaml
