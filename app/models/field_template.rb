# frozen_string_literal: true

# app/models/fields/field_template.rb
class FieldTemplate < ApplicationRecord
  include HumanizerHelper
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

  def third_person_masculine_description
    translate(description, :third_singular_masculine)
  end

  def second_person_singular_description
    translate(description, :second_singular)
  end

  def as_json(_ = {})
    {
      name: name,
      description: description,
      default_value: default_value,
      options: dropdown_options,
      third_person_masculine_description: third_person_masculine_description,
      second_person_singular_description: second_person_singular_description,
      multiple: multiple,
    }
  end
end
