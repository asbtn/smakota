# frozen_string_literal: true

class CreateItems < ActiveRecord::Migration[8.0]

  def change
    create_table :items do |t|
      t.string      :name, null: false, index: { unique: true }
      t.float       :quantity, null: false, default: 0.0, index: true
      t.integer     :unit, null: false
      t.string      :type, null: false

      t.belongs_to :category
      t.belongs_to :user

      t.timestamps
    end
  end

end
