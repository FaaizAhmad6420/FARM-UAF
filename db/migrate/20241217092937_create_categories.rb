class CreateCategories < ActiveRecord::Migration[7.1]
  def change
    create_table :categories do |t|
      t.integer :category, default: 0

      t.timestamps
    end
  end
end
