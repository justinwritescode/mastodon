#!/usr/bin/with-contenv bash
# shellcheck shell=bash

export RAILS_ENV=production
export PATH="/mastodon/bin:${PATH}"

PATH="/mastodon/bin:${PATH}"

cd /mastodon && \
    bin/bundle exec rails server -p 3000
    bash /start-sshd.sh
    bash /start-nginx.sh