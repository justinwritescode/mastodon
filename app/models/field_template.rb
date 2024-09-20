# frozen_string_literal: true

# app/models/fields/field_template.rb
class FieldTemplate < ApplicationRecord
  include HumanizerHelper

  # Define relationships if needed
  has_many :field_values, dependent: :destroy

  # Explicitly declare the 'field_type' attribute with `attribute` method
  attribute :field_type, :string

  enum :field_type, { string: 'string', float: 'float', integer: 'integer', object: 'object' } # Enum backed by string

  # Validations
  validates :name, presence: true
  validates :description, presence: true
  validates :multiple, inclusion: { in: [true, false] }
  validates :field_type, inclusion: { in: field_types.keys }

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
      name: escape_special_characters(name),
      description: escape_special_characters(description),
      default_value: escape_special_characters(default_value),
      options: dropdown_options.map(&:as_json),
      third_person_masculine_description: escape_special_characters(third_person_masculine_description),
      second_person_singular_description: escape_special_characters(second_person_singular_description),
      multiple: multiple,
    }
  end

  # Define the method as a class method using `self.`
  def self.seed_field_templates_from_yaml(file_path)
    # Convert the relative path to an absolute path
    absolute_path = Rails.root.join(file_path).to_s

    # Ensure the file exists before attempting to load it
    raise "File not found: #{absolute_path}" unless File.exist?(absolute_path)

    yaml_content = YAML.load_file(absolute_path)

    yaml_content.each do |field_data|
      FieldTemplate.find_or_create_by(name: field_data['name']) do |template|
        template.dropdown = field_data['dropdown']
        template.description = field_data['description']
        template.multiple = field_data['multiple']
        template.field_type = field_data['type']
        template.category = field_data['category']
        template.save!
        FieldValue.seed_field_values_from_yaml(field_data['name'], field_data['source'])
      end
    end
  end
end
