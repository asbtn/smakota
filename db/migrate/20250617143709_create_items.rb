# frozen_string_literal: true

class CreateItems < ActiveRecord::Migration[8.0]

  def change
    create_table :items do |t|
      t.integer     :unit,        null: false
      t.string      :name,        null: false, index: { unique: true }
      t.jsonb       :nutrition,   null: false, default: {}
      t.foreign_key :categories,  null: false, foreign_key: true
      t.integer     :category_id, null: false

      t.timestamps
    end
  end

end
