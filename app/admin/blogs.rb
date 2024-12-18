ActiveAdmin.register Blog do
  permit_params :title, :description, :image

  form do |f|
    f.inputs 'Blog Details' do
      f.input :title
      f.input :description
      f.input :image, as: :file
    end
    f.actions
  end

  index do
    selectable_column
    id_column
    column :title
    column :description
    column :created_at
    column :image do |product|
      product.image.attached? ? product.image.filename.to_s : 'No Image'
    end
    actions
  end

  config.filters = false
  
  show do
    attributes_table do
      row :title
      row :description
      row :image do |blog|
        image_tag url_for(blog.image) if blog.image.attached?
      end
    end
  end
end
