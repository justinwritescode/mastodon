# frozen_string_literal: true

class MascotController < ApplicationController
  include MascotHelper

  def serve
    redirect_to my_mascot_image_url, status: 302
  end
end
