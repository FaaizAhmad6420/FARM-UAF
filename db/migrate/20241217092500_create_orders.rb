class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.references :users, null: false, foreign_key: true
      t.string :status, default: 'cart', null: false
      t.decimal :total_amount

      t.timestamps
    end
  end
end
