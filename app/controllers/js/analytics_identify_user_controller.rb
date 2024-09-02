# frozen_string_literal: true

module Js
  class AnalyticsIdentifyUserController < ApplicationController
    skip_before_action :verify_authenticity_token, only: :serve
    # Method to serve the user identification JavaScript
    def serve
      if google_analytics_enabled?
        render js: "console.warn('GA_ID is required');"
        return
      end

      # Example user identification script
      script_content = <<~JS
        (() => {
          #{google_analytics_identify_user_javascript(user_info)}
          #{microsoft_clarity_identify_user_javascript(user_info)}
        })();
      JS

      render js: script_content
    end

    private

    def user_info
      current_user ? { id: current_user.id, email: current_user.email } : {}
    end

    def google_analytics_tracking_id
      ENV.fetch('GOOGLE_ANALYTICS_TRACKING_ID', nil)
    end

    def google_analytics_enabled
      ENV.fetch('GOOGLE_ANALYTICS_TRACKING_ID', nil) == 'true' && google_analytics_tracking_id.present?
    end

    def ms_clarity_id
      ENV.fetch('MS_CLARITY_ID', nil)
    end

    def ms_claridy_enabled
      ENV.fetch('MS_CLARITY_ENABLED', nil) == 'true' && ms_clarity_id.present?
    end

    def microsoft_clarity_identify_user_javascript
      return '' if !ms_claridy_enabled || user_info.empty?

      <<~JS
        if(window.clarity) {
          window.clarity("identify", "#{user_info[:id]}");
        }
      JS
    end

    # Method to embed user information into the gtag script
    def google_analytics_identify_user_javascript
      return '' if !google_analytics_enabled || user_info.empty?

      <<~JS
        gtag('js', new Date());
        gtag('config', '#{ga_id}', 'user_id', '#{user_info[:id]}');
      JS
    end
  end
end
