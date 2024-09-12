# frozen_string_literal: true

module EnvironmentHelper
  def environment_script_tag
    javascript_tag '', src: '/js/environment.js', crossorigin: 'anonymous'
  end
end
