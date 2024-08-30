# frozen_string_literal: true

# Be sure to restart your server when you modify this file.

# Define an application-wide content security policy.
# See the Securing Rails Applications Guide for more information:
# https://guides.rubyonrails.org/security.html#content-security-policy-header

require_relative '../../app/lib/content_security_policy'

policy = ContentSecurityPolicy.new
assets_host = policy.assets_host
media_hosts = policy.media_hosts

def sso_host
  return unless ENV['ONE_CLICK_SSO_LOGIN'] == 'true'
  return unless ENV['OMNIAUTH_ONLY'] == 'true'
  return unless Devise.omniauth_providers.length == 1

  provider = Devise.omniauth_configs[Devise.omniauth_providers[0]]
  @sso_host ||= begin
    case provider.provider
    when :cas
      provider.cas_url
    when :saml
      provider.options[:idp_sso_target_url]
    when :openid_connect
      provider.options.dig(:client_options, :authorization_endpoint) || OpenIDConnect::Discovery::Provider::Config.discover!(provider.options[:issuer]).authorization_endpoint
    end
  end
end

Rails.logger.debug { "assets_host = #{assets_host}, media_hosts = #{media_hosts}" }
Rails.logger.debug { "SSO host = #{sso_host}" } if sso_host.present?

ENV.each do |key, value|
  if key.start_with?('CSP_')
    # Emit a debug message with the key and its value
    Rails.logger.debug { "CSP ENV Var - #{key}: #{value}" }
  end
end

Rails.application.config.content_security_policy do |p|
  p.base_uri        :none
  p.default_src     :none
  p.frame_ancestors :none
  p.font_src        :self, assets_host, *ENV.fetch('CSP_FONT_SRC', '').split
  p.img_src         :self, :data, :blob, *media_hosts, *ENV.fetch('CSP_IMG_SRC', '').split
  p.style_src       :self, assets_host, *ENV.fetch('CSP_STYLE_SRC', '').split
  p.media_src       :self, :data, *media_hosts, *ENV.fetch('CSP_MEDIA_SRC', '').split
  p.frame_src       :self, :https, *ENV.fetch('CSP_FRAME_SRC', '').split
  p.manifest_src    :self, assets_host

  if sso_host.present?
    p.form_action     :self, sso_host
  else
    p.form_action     :self
  end

  p.child_src       :self, :blob, assets_host, *ENV.fetch('CSP_CHILD_SRC', '').split
  p.worker_src      :self, :blob, assets_host, *ENV.fetch('CSP_WORKER_SRC', '').split

  if Rails.env.development?
    webpacker_public_host = ENV.fetch('WEBPACKER_DEV_SERVER_PUBLIC', Webpacker.config.dev_server[:public])
    front_end_build_urls = %w(ws http).map { |protocol| "#{protocol}#{Webpacker.dev_server.https? ? 's' : ''}://#{webpacker_public_host}" }

    p.connect_src :self, :data, :blob, *media_hosts, Rails.configuration.x.streaming_api_base_url, *front_end_build_urls, *ENV.fetch('CSP_CONNECT_SRC', '').split
    p.script_src  :self, :unsafe_inline, :unsafe_eval, assets_host, *ENV.fetch('CSP_SCRIPT_SRC', '').split
  else
    p.connect_src :self, :data, :blob, *media_hosts, Rails.configuration.x.streaming_api_base_url, *ENV.fetch('CSP_CONNECT_SRC', '').split
    p.script_src  :self, assets_host, "'wasm-unsafe-eval'", *ENV.fetch('CSP_SCRIPT_SRC', '').split
  end
end

# Report CSP violations to a specified URI
# For further information see the following documentation:
# https://developer.mozilla.org/en-US/docs/Web/HTTP/Headers/Content-Security-Policy-Report-Only
# Rails.application.config.content_security_policy_report_only = true

Rails.application.config.content_security_policy_nonce_generator = ->(_request) { SecureRandom.base64(16) }

Rails.application.config.content_security_policy_nonce_directives = %w(style-src)

Rails.application.reloader.to_prepare do
  PgHero::HomeController.content_security_policy do |p|
    p.script_src :self, :unsafe_inline, assets_host
    p.style_src  :self, :unsafe_inline, assets_host
  end

  PgHero::HomeController.after_action do
    request.content_security_policy_nonce_generator = nil
  end

  if Rails.env.development?
    LetterOpenerWeb::LettersController.content_security_policy do |p|
      p.child_src       :self
      p.connect_src     :none
      p.frame_ancestors :self
      p.frame_src       :self
      p.script_src      :unsafe_inline
      p.style_src       :unsafe_inline
      p.worker_src      :none
    end

    LetterOpenerWeb::LettersController.after_action do
      request.content_security_policy_nonce_directives = %w(script-src)
    end
  end
end
