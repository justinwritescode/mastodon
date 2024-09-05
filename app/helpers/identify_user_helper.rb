# frozen_string_literal: true

module IdentifyUserHelper
  def google_analytics_tracking_id
    ENV.fetch('GOOGLE_ANALYTICS_TRACKING_ID', nil)
  end

  # Method to include Google Analytics script with user identification
  def identify_user_javascript
    return '' if google_analytics_tracking_id.nil?

    javascript_tag '', src: "https://www.googletagmanager.com/gtag/js?id=#{google_analytics_tracking_id}"
    javascript_tag '', src: URI.join(root_url, '/js/identify_user.js')
  end
end
