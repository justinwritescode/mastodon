# frozen_string_literal: true

module GoogleTagManagerHelper
  # Method to include Google Tag Manager script tag
  def google_tag_manager_script_tag(gtm_id)
    gtm_id ||= ENV.fetch('GTM_ID', nil)

    return if gtm_id.blank?

    # JavaScript code for Google Tag Manager
    script_content = <<~JS
      <!-- Google Tag Manager -->
      <script>(function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
      new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
      j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
      'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
      })(window,document,'script','dataLayer','#{gtm_id}');</script>
      <!-- End Google Tag Manager -->
    JS

    script_content.html_safe
  end

  # Method to include Google Tag Manager noscript tag
  def google_tag_manager_noscript_tag(gtm_id)
    gtm_id ||= ENV.fetch('GTM_ID', nil)

    return if gtm_id.blank?

    # Noscript code for Google Tag Manager
    noscript_content = <<~HTML
      <!-- Google Tag Manager (noscript) -->
      <noscript><iframe src="https://www.googletagmanager.com/ns.html?id=#{gtm_id}"
      height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
      <!-- End Google Tag Manager (noscript) -->
    HTML

    noscript_content.html_safe
  end
end
