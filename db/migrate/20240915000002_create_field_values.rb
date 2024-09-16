# frozen_string_literal: true

# db/migrate/xxxxxx_create_field_values.rb
class CreateFieldValues < ActiveRecord::Migration[6.1]
  def change
    create_table :field_values do |t|
      t.references :field_template, null: false, foreign_key: true
      t.string :value, null: false
      t.text :description
      t.boolean :default, default: false

      t.timestamps
    end

    reversible do |dir|
      dir.down do
        drop_table :field_values
      end
    end
  end
end
