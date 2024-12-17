# app/admin/carts.rb

ActiveAdmin.register Cart do
  permit_params :order_id, :product_id, :size_id, :quantity, :price

  # Displaying a list of cart items
  index do
    selectable_column
    id_column
    column :order
    column :product
    column :size
    column :quantity
    column :price
    actions
  end

  # Show page for each cart item
  show do
    attributes_table do
      row :id
      row :order
      row :product
      row :size
      row :quantity
      row :price
      row :created_at
      row :updated_at
    end
  end

  # Form for creating/editing cart items
  form do |f|
    f.inputs do
      f.input :order
      f.input :product
      f.input :size
      f.input :quantity
      f.input :price
    end
    f.actions
  end
end
