# frozen_string_literal: true

class EnvironmentController < ApplicationController
  def show
    environment_variables = {
      api_base_url: ENV.fetch('API_BASE_URL', nil),
      google_analytics_enabled: ENV.fetch('GOOGLE_ANALYTICS_ENABLED', nil),
      matomo_enabled: ENV.fetch('MATOMO_ENABLED', nil),
      google_tag_manager_enabled: ENV.fetch('GOOGLE_TAG_MANAGER_ENABLED', nil),
      ms_clarity_enabled: ENV.fetch('MS_CLARITY_ENABLED', nil),
    }

    render json: environment_variables
  end
end
