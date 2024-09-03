# frozen_string_literal: true

module ErrorsAssetHelper
  def error_asset_url(asset_path)
    frontend_asset_url(asset_path.split('
')[0]).to_s
  end
end
