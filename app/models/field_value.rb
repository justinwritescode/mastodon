# frozen_string_literal: true

# app/models/field_value.rb
class FieldValue < ApplicationRecord
  include HumanizerHelper
  # Define relationships
  belongs_to :field_template

  # Validations
  validates :description, presence: true, allow_blank: true
  validates :default, inclusion: { in: [true, false] }
  attribute :default, :boolean, default: false
  attribute :order, :integer, default: 0

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
      order: order,
      third_person_masculine_display_value: escape_special_characters(third_person_masculine_display_value),
      second_person_singular_display_value: escape_special_characters(second_person_singular_display_value),
      third_person_masculine_description: escape_special_characters(third_person_masculine_description),
      second_person_singular_description: escape_special_characters(second_person_singular_description),
    }
  end

  def self.seed_field_values_from_yaml(field_template_name, file_path)
    field_template = FieldTemplate.find_by(name: field_template_name)
    raise "Field Template \"#{field_template_name}\" not found" if field_template.nil?

    # Convert the relative path to an absolute path
    absolute_path = Rails.root.join(file_path).to_s

    yaml_content = YAML.load_file(absolute_path)

    yaml_content.each do |field_value|
      FieldValue.find_or_create_by(value: field_value['value'], field_template_id: field_template.id) do |value|
        value.value = field_value['value']
        value.display_value = field_value['display_value']
        value.description = field_value['description']
        value.default = field_value['default']
        value.order = field_value['order']
        value.save!
      end
    end
  end
end
