ActiveAdmin.register Category do
  permit_params :category

  form do |f|
    f.inputs 'Category Details' do
      f.input :category
    end
    f.actions
  end

  filter :category

  index do
    selectable_column
    id_column
    column :category
    actions
  end
end
