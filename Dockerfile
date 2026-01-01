FROM livekit/livekit-server:latest

# Copy your config from the repo into the container
COPY config.yaml /etc/livekit/config.yaml

# Expose the main port (signaling)
EXPOSE 7880

# Start LiveKit with your config and bind to the Railway $PORT
ENTRYPOINT ["/bin/sh", "-c"]

CMD ["/bin/sh", "-c", "/livekit-server --config /etc/livekit/config.yaml"]

