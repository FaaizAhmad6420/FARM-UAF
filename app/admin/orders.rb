# app/admin/orders.rb

ActiveAdmin.register Order do
  permit_params :user_id, :status, :total_amount

  # Displaying a list of orders
  index do
    selectable_column
    id_column
    column :user
    column :status
    column :total_amount
    column :created_at
    actions
  end

  filter :user_id

  # Show page for each order
  show do
    attributes_table do
      row :id
      row :user
      row :status
      row :total_amount
      row :created_at
      row :updated_at
    end

    panel "Cart Items" do
      table_for order.carts do
        column :product
        column :size
        column :quantity
        column :price
      end
    end
  end

  # Form for creating/editing orders
  form do |f|
    f.inputs do
      f.input :user
      f.input :status, as: :select, collection: ['cart', 'completed'] # Adjust as per your status enum
      f.input :total_amount
    end
    f.actions
  end
end
