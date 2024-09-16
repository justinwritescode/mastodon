# frozen_string_literal: true

# db/migrate/xxxxxx_create_field_templates.rb
class CreateFieldTemplates < ActiveRecord::Migration[6.1]
  def change
    create_table :field_templates do |t|
      t.string :name, null: false
      t.string :description, null: true
      t.boolean :dropdown, default: false

      t.timestamps
    end

    reversible do |dir|
      dir.down do
        drop_table :field_templates
      end
    end
  end
end
