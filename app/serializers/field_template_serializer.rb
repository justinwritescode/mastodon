# frozen_string_literal: true

# app/serializers/field_template_serializer.rb
# Serializer for FieldTemplate model
class FieldTemplateSerializer < ActiveModel::Serializer
  attributes :id, :name, :field_type, :category, :dropdown, :multiple, :description,
             :first_person_singular_description, :second_person_singular_description,
             :third_person_masculine_description

  has_many :field_values
end
