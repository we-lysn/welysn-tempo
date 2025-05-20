#!/bin/sh
# Replace env vars in tempo.yaml and start Tempo

envsubst < /etc/tempo.yaml > /tmp/tempo.yaml
exec /usr/bin/tempo -config.file=/tmp/tempo.yaml
