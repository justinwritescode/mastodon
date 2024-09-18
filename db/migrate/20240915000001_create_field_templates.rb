# frozen_string_literal: true

# db/migrate/xxxxxx_create_field_templates.rb
class CreateFieldTemplates < ActiveRecord::Migration[7.1]
  def up
    create_table :field_templates do |t|
      t.string :name, null: false
      t.string :description, null: true
      t.boolean :dropdown, default: false
      t.boolean :multiple

      t.timestamps
    end
  end

  def down
    drop_table :field_templates
  end
end
