class CreatePantryItems < ActiveRecord::Migration[8.0]

  def change
    create_table :pantry_items do |t|
      t.belongs_to :item
      t.belongs_to :user
      t.integer    :quantity, null: false, default: 0, index: true

      t.timestamps
    end
  end

end
