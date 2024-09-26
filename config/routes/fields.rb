# frozen_string_literal: true

get '/api/vnext/fields/templates.json', to: 'api/vnext/fields#templates'
get '/api/vnext/fields/templates.js', to: 'api/vnext/fields#templates_js'

get '/settings/profile/css', to: 'settings/profile#css'
get '/settings/profile/js', to: 'settings/profile#js'

namespace :admin do
  resources :field_templates do
    resources :field_values
  end
end
