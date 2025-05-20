FROM grafana/tempo:latest

# Copy the configuration file
COPY tempo.yaml /etc/tempo.yaml

# Copy entrypoint script
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Expose the necessary ports
EXPOSE 3200
EXPOSE 4317

# Set the entrypoint
ENTRYPOINT ["/entrypoint.sh"]

# Set the command to run Tempo with the configuration file
CMD ["-config.file=/etc/tempo.yaml"]