# frozen_string_literal: true

# db/migrate/xxxxxx_create_field_templates.rb
class CreateFieldTemplates < ActiveRecord::Migration[7.1]
  def up
    create_table :field_templates do |t|
      t.text :name, null: false
      t.text :description, null: true
      t.text :field_type, null: true
      t.text :category, null: true
      t.boolean :dropdown, default: false, null: false
      t.boolean :multiple, default: false, null: false

      t.timestamps
    end
  end

  def down
    drop_table :field_templates
  end
end
