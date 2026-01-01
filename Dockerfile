FROM livekit/livekit-server:1.9

# Copy your config from the repo into the container
COPY config.yaml /etc/livekit/config.yaml

# Expose the main port (signaling)
EXPOSE 7880

# Optional: health check
HEALTHCHECK --interval=30s --timeout=5s --start-period=5s --retries=3 \
  CMD curl -f http://localhost:7880/ || exit 1

# Start LiveKit with your config and bind to the Railway $PORT
ENTRYPOINT ["/bin/sh", "-c"]
CMD ["exec livekit-server --config /etc/livekit/config.yaml --bind 0.0.0.0:$PORT"]
