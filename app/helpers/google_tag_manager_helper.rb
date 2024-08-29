# frozen_string_literal: true

module GoogleTagManagerHelper
  def google_tag_manager(gtm_id)
    return if gtm_id.blank?

    javascript_tag <<~HTML
      <!-- Google Tag Manager -->
        (function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
        new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
        j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
        'https://www.googletagmanager.com/gtm.js?id='+i+dl;f.parentNode.insertBefore(j,f);
        })(window,document,'script','dataLayer','#{gtm_id}');
      <!-- End Google Tag Manager -->
    HTML
  end

  def google_tag_manager_noscript(gtm_id)
    return if gtm_id.blank?

    tag.noscript <<~HTML
      <!-- Google Tag Manager (noscript) -->
        <iframe src="https://www.googletagmanager.com/ns.html?id=#{gtm_id}"
                height="0" width="0" style="display:none;visibility:hidden"></iframe>
      <!-- End Google Tag Manager (noscript) -->
    HTML
  end
end
