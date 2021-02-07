# Start from Alpine.
FROM alpine

# Install QR encode.
RUN apk add --no-cache libqrencode

# Run QR encode.
ENTRYPOINT [ "qrencode" ]
