# frozen_string_literal: true

module MascotHelper
  require 'fastimage'
  include RoutingHelper

  BASE_PATH = '/app/javascript'
  MASCOTS_BASE_PATH = 'images/mascots/'
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
    Rails.logger.debug { "mascot_images_directory: #{mascot_images_directory}" }

    if directory_path.blank?
      Rails.logger.error "Environment variable 'MASCOT_IMAGES_DIRECTORY' is not set."
      return nil
    end

    unless Dir.exist?(mascot_images_directory)
      Rails.logger.error "Directory #{mascot_images_directory} does not exist."
      return nil
    end

    image_files = Dir.glob("#{mascot_images_directory}/*.{jpg,jpeg,png,gif}")
    image_file = image_files.sample

    filename = File.basename(image_file)
    frontend_asset_url(MASCOTS_BASE_PATH + filename).to_s
  end
end
