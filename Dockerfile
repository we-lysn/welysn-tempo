FROM grafana/tempo:latest

USER root

# Copy the configuration file
COPY tempo.yaml /etc/tempo.yaml

# Copy entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Expose the necessary ports
EXPOSE 3200
EXPOSE 4317

# Set the environment variable for Tempo configuration
CMD ["/entrypoint.sh"]