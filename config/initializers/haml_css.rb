# frozen_string_literal: true

Rails.application.config.assets.configure do |env|
  env.register_mime_type 'text/css', extensions: ['css.haml'], charset: :css
  env.register_transformer 'text/css', 'text/css', ->(template) { Haml::Engine.new(template).render}
end
