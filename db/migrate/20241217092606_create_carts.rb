class CreateCarts < ActiveRecord::Migration[7.1]
  def change
    create_table :carts do |t|
      t.references :order, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true
      t.references :size, null: false, foreign_key: true

      t.timestamps
      t.integer :quantity
      t.decimal :price
    end
  end
end
