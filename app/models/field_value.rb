# frozen_string_literal: true

# app/models/field_value.rb
class FieldValue < ApplicationRecord
  include HumanizerHelper
  # Define relationships
  belongs_to :field_template

  # Validations
  validates :value, presence: true
  validates :description, presence: true, allow_blank: true
  validates :default, inclusion: { in: [true, false] }

  def third_person_masculine_display_value
    translate(display_value, :third_singular_masculine)
  end

  def second_person_singular_display_value
    translate(display_value, :second_singular)
  end

  def third_person_masculine_description
    translate(description, :third_singular_masculine)
  end

  def second_person_singular_description
    translate(description, :second_singular)
  end

  def as_json
    {
      value: value,
      display_value: display_value.presence || value,
      description: description,
      default: default,
      third_person_masculine_display_value: third_person_masculine_display_value,
      second_person_singular_display_value: second_person_singular_display_value,
      third_person_masculine_description: third_person_masculine_description,
      second_person_singular_description: second_person_singular_description,
    }
  end
end
