#!/bin/sh

printf "Replace ENV variables in build...\\n"

# Iterate over each file in the project directory
find /app \
  -type f \
  -exec sed \
  -i'' \
  -e "s|__BASE_URL__|$BASE_URL|g" \
  {} +

printf "Starting application...\\n"

nginx -g "daemon off;"