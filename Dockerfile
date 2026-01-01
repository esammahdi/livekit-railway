# Start from the official LiveKit server image
FROM livekit/livekit-server:1.9

# Expose the HTTP/WebSocket signaling port to Railway
EXPOSE 7880

# Provide a simple healthcheck based on the LiveKit HTTP status
HEALTHCHECK --interval=30s --timeout=5s --start-period=5s --retries=3 \
  CMD curl -f http://localhost:7880/ || exit 1

# Override ENTRYPOINT & CMD to use the Railway $PORT
# Use /bin/sh -c so that $PORT expands correctly
ENTRYPOINT ["/bin/sh", "-c"]

CMD ["exec livekit-server --config /etc/livekit/config.yaml --bind 0.0.0.0:$PORT"]
