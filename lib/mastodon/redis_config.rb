# frozen_string_literal: true

def setup_redis_env_url(prefix = nil, defaults = true)
  prefix = "#{prefix.to_s.upcase}_" unless prefix.nil?
  prefix = '' if prefix.nil? # Ensure it's an empty string if it's nil

  return if ENV["#{prefix}REDIS_URL"].present?

  password = ENV.fetch("#{prefix}REDIS_PASSWORD", nil)
  host     = ENV.fetch("#{prefix}REDIS_HOST", 'localhost')
  port     = ENV.fetch("#{prefix}REDIS_PORT", 6379).to_i
  db       = ENV.fetch("#{prefix}REDIS_DB", 0).to_i

  ENV["#{prefix}REDIS_URL"] = begin
    if [password, host, port, db].all?(&:nil?)
      ENV['REDIS_URL']
    else
      Addressable::URI.parse("redis://#{host}:#{port}/#{db}").tap do |uri|
        uri.password = password if password.present?
      end.normalize.to_str
    end
  end
end

setup_redis_env_url
setup_redis_env_url(:cache, false)
setup_redis_env_url(:sidekiq, false)

namespace         = ENV.fetch('REDIS_NAMESPACE', nil)
cache_namespace   = namespace ? "#{namespace}_cache" : 'cache'
sidekiq_namespace = namespace

redis_driver = ENV.fetch('REDIS_DRIVER', 'hiredis') == 'ruby' ? :ruby : :hiredis

# Use environment variable for concurrency or default value
CONCURRENCY = ENV.fetch('SIDEKIQ_CONCURRENCY', 5).to_i
MAX_THREADS = ENV.fetch('MAX_THREADS', 5).to_i

REDIS_CACHE_PARAMS = {
  driver: redis_driver,
  url: ENV['CACHE_REDIS_URL'],
  expires_in: 10.minutes,
  namespace: "#{cache_namespace}:7.1",
  connect_timeout: 5,
  pool: {
    size: Sidekiq.server? ? CONCURRENCY : MAX_THREADS,
    timeout: 5,
  },
}.freeze

REDIS_SIDEKIQ_PARAMS = {
  driver: redis_driver,
  url: ENV['SIDEKIQ_REDIS_URL'],
  namespace: sidekiq_namespace,
}.freeze

ENV['REDIS_NAMESPACE'] = "mastodon_test#{ENV['TEST_ENV_NUMBER']}" if Rails.env.test?
