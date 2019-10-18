#!/bin/bash
set -e

rm -f /myapp/tmp/pids/server.pid
bundle
rails db:create db:migrate db:seed
exec "$@"