# frozen_string_literal: true

module GoogleTagManagerHelper
  extend ActiveSupport::Concern
  include ActionView::Helpers::AssetTagHelper
  include RoutingHelper
  include Webpacker::Helper
  # Method to include Google Tag Manager script tag
  def google_tag_manager_script_tag
    javascript_tag '', src: URI.join(asset_host, '/js/google_tag_manager.js') unless gtm_id.blank? || gtm_id.nil?
  end

  # Method to include Google Tag Manager noscript tag
  def google_tag_manager_noscript_tag
    # Noscript code for Google Tag Manager
    noscript_content.html_safe unless gtm_id.blank? || gtm_id.nil? # rubocop:disable Rails/OutputSafety
  end

  def gtm_id
    ENV.fetch('GOOGLE_TAG_MANAGER_ID', nil)
  end

  def noscript_content
    <<~HTML
      <!-- Google Tag Manager (noscript) -->
      <noscript><iframe src="https://www.googletagmanager.com/ns.html?id=#{gtm_id}"
      height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
      <!-- End Google Tag Manager (noscript) -->
    HTML
  end
end
