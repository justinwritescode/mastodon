# frozen_string_literal: true

require 'redis'
require 'hiredis'

Redis.sadd_returns_boolean = false
Redis.current = Redis.new(url: ENV.fetch('REDIS_URL', 'redis://localhost:6379/1'), driver: :hiredis)
