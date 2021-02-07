#!/bin/bash
ssid="${1}"
password="${2}"

# Check SSID and password.
if [ -z "${ssid}" ] || [ -z "${password}" ]
then
  # Print usage.
  echo "Usage: ${0} ssid password"
  # Exit with error.
  exit 1
fi

# Build image.
docker build --quiet --tag qrencode:latest .

# Generate QR code.
echo "WIFI:T:WPA;S:${ssid};P:${password};;" | docker run --rm --interactive --net none qrencode:latest -l H -o - > "${ssid}.png"
