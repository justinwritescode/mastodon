#!/usr/bin/with-contenv bash
# shellcheck shell=bash

export RAILS_ENV=production
export PATH="/mastodon/bin:${PATH}"

cd /mastodon && \
node ./streaming
