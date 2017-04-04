#!/usr/bin/env bash
find . -type d -maxdepth 1 \
  -exec bash -c "cd '{}' && if [ \$PWD'/package.json'  ]; then \
  echo 'Installing node_modules in ' \$PWD; npm install; fi" \;
