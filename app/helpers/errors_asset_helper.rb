# frozen_string_literal: true

module ErrorsAssetHelper
  def error_asset_url(asset_path)
    URI.join(asset_host, asset_path.split('\n')[0]).to_s
  end
end
