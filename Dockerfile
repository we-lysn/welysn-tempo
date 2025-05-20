FROM grafana/tempo:latest

# Copy the configuration file
COPY tempo.yaml /etc/tempo.yaml

# Expose the necessary ports
EXPOSE 3200
EXPOSE 4317

# Set the command to run Tempo with the configuration file
CMD ["/bin/sh", "-c", "envsubst < /etc/tempo/tempo.template.yaml > /etc/tempo/tempo.yaml && /usr/bin/tempo -config.file=/etc/tempo/tempo.yaml"]
CMD ["-config.file=/etc/tempo.yaml"]