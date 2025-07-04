# frozen_string_literal: true

class CreateCategories < ActiveRecord::Migration[8.0]

  def change
    create_table :categories do |t|
      t.string :name, null: false, index: { unique: true }
      t.string :type, null: false # STI

      t.timestamps
    end
  end

end
