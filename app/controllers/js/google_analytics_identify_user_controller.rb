# frozen_string_literal: true

module Js
  class GoogleAnalyticsIdentifyUserController < ApplicationController
    skip_before_action :verify_authenticity_token, only: :serve
    # Method to serve the user identification JavaScript
    def serve
      tracking_id ||= ENV.fetch('GA_ID', nil)

      if tracking_id.blank? || tracking_id.nil?
        render js: "console.warn('GA_ID is required');"
        return
      end

      user_info = current_user ? { id: current_user.id, email: current_user.email } : {}

      # Example user identification script
      script_content = <<~JS
        (() => {
          #{embed_user_info(user_info)}

          window.dataLayer = window.dataLayer || [];
          function gtag(){dataLayer.push(arguments);}
          gtag('js', new Date());

          gtag('config', '#{tracking_id}');
        })();
      JS

      render js: script_content
    end

    private

    # Method to embed user information into the gtag script
    def embed_user_info(user_info)
      return '' if user_info.empty?

      <<~JS
        gtag('set', {
          'user_id': '#{user_info[:id]}',
          'user_email': '#{user_info[:email]}'
        });
      JS
    end
  end
end
