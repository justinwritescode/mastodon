#!/usr/bin/with-contenv bash
# shellcheck shell=bash

set -e
export RAILS_ENV=production
export PATH="/mastodon/bin:${PATH}"

if [[ $PROGRAM == "mastodon" ]]; then
    bash /start-mastodon.sh;
elif [[ $PROGRAM == "sidekiq" ]]; then
    bash /start-sidekiq.sh;
elif [[ $PROGRAM == "streaming" ]]; then
    bash /start-streaming.sh;
else
    echo "Program '${PROGRAM}' could not be started.";
fi