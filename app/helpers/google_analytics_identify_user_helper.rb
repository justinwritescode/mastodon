# frozen_string_literal: true

module GoogleAnalyticsIdentifyUserHelper
  # Method to include Google Analytics script with user identification
  def google_analytics_identify_user
    javascript_tag '', src: '/js/ga.js'
    # tracking_id ||= ENV.fetch('GA_ID', nil)

    # return if tracking_id.blank?

    # user_info = current_user ? { id: current_user.id, email: current_user.email } : {}

    # # JavaScript code for Google Analytics
    # script_content = <<~JS
    #   <!-- Global site tag (gtag.js) - Google Analytics -->
    #   <script async src="https://www.googletagmanager.com/gtag/js?id=#{tracking_id}"></script>
    #   <script>
    #     window.dataLayer = window.dataLayer || [];
    #     function gtag(){dataLayer.push(arguments);}
    #     gtag('js', new Date());

    #     gtag('config', '#{tracking_id}');

    #     #{embed_user_info(user_info)}
    #   </script>
    # JS

    # script_content.html_safe
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
