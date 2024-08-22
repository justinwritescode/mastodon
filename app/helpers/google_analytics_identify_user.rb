module GoogleAnalyticsHelper
  def google_analytics_identify_user
    if user_signed_in?
      user_id = current_user.username # or other unique identifier

      javascript_tag do
        <<-JS.html_safe
          gtag('config', '#{Rails.application.credentials.google_analytics[:tracking_id]}', { 'user_id': '#{user_id}' });
        JS
      end
    end
  end
end