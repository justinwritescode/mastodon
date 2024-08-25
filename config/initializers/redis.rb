# frozen_string_literal: true

Redis.sadd_returns_boolean = false
Redis.current = Redis.new(url: ENV.fetch('REDIS_URL'))
