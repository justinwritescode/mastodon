# frozen_string_literal: true

# app/models/fields/field_template.rb
class FieldTemplate < ApplicationRecord
  # Define relationships if needed
  has_many :field_values, dependent: :destroy

  # Validations
  validates :name, presence: true
  validates :description, presence: true

  # Methods for retrieving drop-down options
  def dropdown_options
    field_values.order(:value)
  end

  # Method to retrieve the default value
  def default_value
    field_values.find_by(default: true)&.value
  end
end
