#!/bin/sh
# entrypoint.sh
if [ -f /original_product/tmp/pids/server.pid ]; then
  rm /original_product/tmp/pids/server.pid
fi
bundle exec rails s -p 3000 -b '0.0.0.0'