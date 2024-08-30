#!/usr/bin/with-contenv bash
# shellcheck shell=bash

export RAILS_ENV=production
export PATH="/mastodon/bin:${PATH}"

if pgrep -f "sshd:" >/dev/null; then
    echo "Zombie sshd processes detected, sending SIGTERM"
    pkill -ef sshd:
    sleep 1
fi

if pgrep -f "sshd:" >/dev/null; then
    echo "Zombie sshd processes still active, sending SIGKILL"
    pkill -9 -ef sshd:
    sleep 1
fi

exec /usr/sbin/sshd
