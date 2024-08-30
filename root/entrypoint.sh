#!/bin/bash

cd /mastodon && \
    bin/bundle exec rails server -p 3000
    bash /start-sshd.sh
    bash /start-nginx.sh