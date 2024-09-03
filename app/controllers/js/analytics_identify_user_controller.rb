# frozen_string_literal: true

module Js
  class AnalyticsIdentifyUserController < ApplicationController
    skip_before_action :verify_authenticity_token, only: :serve
    before_action :authenticate_user!
    # Method to serve the user identification JavaScript
    def serve
      # Example user identification script
      script_content = <<~JS
        (() => {
          #{google_analytics_identify_user_javascript}
          #{microsoft_clarity_identify_user_javascript}
          #{matomo_identify_user_javascript}
        })();
      JS

      render js: script_content, content_type: 'application/javascript'
    end

    private

    def matomo_site_id
      ENV.fetch('MATOMO_SITE_ID', nil)
    end

    def matomo_enabled
      ENV.fetch('MATOMO_ENABLED', 'false') == 'true' #  && matomo_site_id.present?
    end

    def session_id
      current_session.session_id
    end

    def matomo_identify_user_javascript
      return 'console.log("Matomo is not enabled");' unless matomo_enabled
      return 'console.log("No currently logged-in user");' if user_info.empty?

      <<~JS
        <!-- Matomo identify user -->
        let _paq = window._paq = window._paq || [];
        _paq.push('setUserId', "#{user_id}")
        <!-- Enc Matomo identify user -->
      JS
    end

    def user_id
      return nil if user_info.empty?

      user_info[:id]
    end

    def user_info
      current_user ? { id: current_account.id, name: "#{current_account.username}@#{current_account.domain}" } : {}
    end

    def google_analytics_tracking_id
      ENV.fetch('GOOGLE_ANALYTICS_TRACKING_ID', nil)
    end

    def google_analytics_enabled
      ENV.fetch('GOOGLE_ANALYTICS_ENABLED', 'false') == 'true' # && google_analytics_tracking_id.present?
    end

    def ms_clarity_id
      ENV.fetch('MS_CLARITY_ID', nil)
    end

    def ms_clarity_enabled
      ENV.fetch('MS_CLARITY_ENABLED', 'false') == 'true' # && ms_clarity_id.present?
    end

    def microsoft_clarity_identify_user_javascript
      return 'console.log("Microsoft Clarity Identify user is not enabled.");' if !ms_clarity_enabled || user_info.empty?

      <<~JS
        <!-- Microsoft Clarity identify user -->
        if(window.clarity) {
          window.clarity("identify", "#{user_id}", "#{session_id}");
        }
        else {
          console.error("Microsoft Clarity is 'enabled' but the 'window.clarity' object was not found.");
        }
        <!-- End Microsoft Clarity identify user -->
      JS
    end

    # Method to embed user information into the gtag script
    def google_analytics_identify_user_javascript
      return 'console.log("Google Analytics Identify user is not enabled.");' if !google_analytics_enabled || user_info.empty?

      <<~JS
        <!-- Google Analytics identify user -->
        if(dataLayer) {
          dataLayer.push({
            'user_id': '#{user_info[:id]}'
          });
        }
        else {
          console.error('Google Analytics Identify user is enabled but the gtag was not found on the page.');
        }
        <!-- End Google Analytics identify user -->
      JS
    end
  end
end
