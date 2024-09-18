# frozen_string_literal: true

# db/migrate/xxxxxx_create_field_values.rb
class CreateFieldValues < ActiveRecord::Migration[7.1]
  def up
    create_table :field_values do |t|
      t.references :field_template, null: false, foreign_key: true
      t.float :value, null: true
      t.string :display_value, null: false
      t.text :description
      t.boolean :default, default: false

      t.timestamps
    end
  end

  def down
    drop_table :field_values
  end
end
