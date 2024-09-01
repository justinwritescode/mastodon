# frozen_string_literal: true

module GoogleAnalyticsIdentifyUserHelper
  # Method to include Google Analytics script with user identification
  def google_analytics_identify_user
    return '' if ENV['GA_ID'].nil?

    javascript_tag '', src: "https://www.googletagmanager.com/gtag/js?id=#{ENV.fetch('GA_ID', nil)}"
    javascript_tag '', src: '/js/ga.js'
  end

  private

  # Method to embed user information into the gtag script
  def embed_user_info(user_info)
    return '' if user_info.empty? || user_info.mil?

    <<~JS
      gtag('set', {
        'user_id': '#{user_info[:id]}',
        'user_email': '#{user_info[:email]}'
      });
    JS
  end
end
