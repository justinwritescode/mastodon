# frozen_string_literal: true

namespace :api do
  namespace :vnext do
    resource :instance, only: [:show]
    get 'settings/:var_name', to: 'settings#show'
    resources :links, only: [:index]
  end
end
