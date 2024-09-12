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
    Rails.logger.debug { "mascot_images_directory: #{mascot_images_directory}" }

    if directory_path.blank?
      Rails.logger.error "Environment variable 'MASCOT_IMAGES_DIRECTORY' is not set."
      return []
    end

    unless Dir.exist?(mascot_images_directory)
      Rails.logger.error "Directory #{mascot_images_directory} does not exist."
      return []
    end

    unless Dir.exist?(mascot_images_directory)
      Rails.logger.error "Directory #{mascot_images_directory} does not exist."
      return []
    end

    Dir.glob("#{mascot_images_directory}/*.{jpg,jpeg,png,gif}")
  end

  def random_mascot_image
    mascot_images.sample
  end

  def my_mascot_image_url
    image_file = random_mascot_image

    filename = File.basename(image_file)
    frontend_asset_url(MASCOTS_BASE_PATH + filename).to_s
  end
end
