FROM ubuntu/tempo:2.7.1-24.04_stable

USER root

RUN apt-get update && \
    apt-get install -y gettext

# Copy the configuration file
COPY tempo.yaml /etc/tempo.yaml

# Expose the necessary ports
EXPOSE 3200
EXPOSE 4317

RUN envsubst < /etc/tempo.yaml > /tmp/tempo.yaml

# Set the environment variable for Tempo configuration
CMD ["-config.file=/tmp/tempo.yaml"]
