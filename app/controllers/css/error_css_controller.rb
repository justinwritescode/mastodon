# frozen_string_literal: true

module Css
  class ErrorCssController < ApplicationController
    def serve
      respond_to do |format|
        format.css { render template: 'views/css/error' }
      end
    end
  end
end
