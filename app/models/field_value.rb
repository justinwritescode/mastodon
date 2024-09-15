# frozen_string_literal: true

# app/models/field_value.rb
class FieldValue < ApplicationRecord
  # Define relationships
  belongs_to :field_template

  # Validations
  validates :value, presence: true
  validates :description, presence: true, allow_blank: true
  validates :default, inclusion: { in: [true, false] }
end
