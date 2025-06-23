FROM grafana/tempo:latest

# Copy the configuration file
COPY tempo.yaml /etc/tempo.yaml

# Expose the necessary ports
EXPOSE 4200
EXPOSE 5317

# Set the command to run Tempo with the configuration file
CMD ["-config.file=/etc/tempo.yaml", "-config.expand-env=true"]
