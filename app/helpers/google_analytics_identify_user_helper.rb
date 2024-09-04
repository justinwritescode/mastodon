# frozen_string_literal: true

module GoogleAnalyticsIdentifyUserHelper
  # Method to include Google Analytics script with user identification
  def google_analytics_identify_user
    return '' if ga_id.nil?

    javascript_tag '', src: "https://www.googletagmanager.com/gtag/js?id=#{ga_id}"
    javascript_tag '', src: '/js/ga.js'
  end
end
