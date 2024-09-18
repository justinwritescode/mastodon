# frozen_string_literal: true

class FieldsController < ApplicationController
  def templates
    field_templates = FieldTemplate.all

    render json: field_templates, content_type: 'application/field-templates+json'
  rescue ActiveRecord::RecordNotFound
    render json: { error: 'FieldTemplates not found' }, status: 404
  end
end
