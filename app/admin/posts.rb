# frozen_string_literal: true

ActiveAdmin.register Post do
  permit_params :title, :status

  index do
    index_column
    column :title
    column :category
    column :status
    column :user
    column :published_at
    actions
  end

  form do |f|
    f.inputs do
      f.semantic_errors
      f.input :title
      f.input :status
    end
    panel 'Thumbnail' do
      image_tag f.object.thumbnail_url(:thumb)
    end
    panel 'Preview' do
      simple_format f.object.content
    end
    f.actions
  end
end
