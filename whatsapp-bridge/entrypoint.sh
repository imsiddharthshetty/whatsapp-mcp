#!/bin/sh
# Ensure store directory exists and is writable
mkdir -p /app/store
chmod 700 /app/store
exec ./whatsapp-bridge
