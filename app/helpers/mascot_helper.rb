# frozen_string_literal: true

module MascotHelper
  require 'fastimage'
  include RoutingHelper

  BASE_PATH = '/app/javascript'
  CACHE_TTL = 60.minutes.freeze
  MY_MASCOT_TTL = 1.minute.freeze

  def mascot_images_directory
    ENV.fetch('MASCOT_IMAGES_DIRECTORY', nil)
  end

  def mascot_images
    Rails.cache.fetch('mascot_images', expires_in: CACHE_TTL) { load_mascot_images }
  end

  def my_mascot_image_url_key
    "my_mascot_image_url_#{session_id}"
  end

  def my_mascot_image_url
    Rails.cache.fetch('mascot_images', expires_in: MY_MASCOT_TTL) { mascot_images.sample }
  end

  private

  def session_id
    current_session.session_id
  end

  def current_session
    SessionActivation.find_by(session_id: cookies.signed['_session_id']) if cookies.signed['_session_id'].present?
  end

  def load_mascot_images
    Rails.logger.debug { "mascot_images_directory: #{mascot_images_directory}" }

    if directory_path.blank?
      Rails.logger.error "Environment variable 'MASCOT_IMAGES_DIRECTORY' is not set."
      return { images: [], total_images: 0 }
    end

    unless Dir.exist?(mascot_images_directory)
      Rails.logger.error "Directory #{mascot_images_directory} does not exist."
      return { images: [], total_images: 0 }
    end

    image_files = Dir.glob("#{mascot_images_directory}/*.{jpg,jpeg,png,gif}")

    images = image_files.map do |image_path|
      dimensions = FastImage.size(image_path)
      filename = File.basename(image_path)
      asset_url = frontend_asset_url(image_path.sub(BASE_PATH, ''))
      {
        filename: filename,
        dimensions: dimensions,
        asset_url: asset_url,
      }
    end

    total_images = images.size

    { images: images, total_images: total_images }
  end
end
