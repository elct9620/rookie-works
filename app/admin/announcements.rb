# frozen_string_literal: true

ActiveAdmin.register Announcement do
  permit_params :title, :status, :content

  index do
    index_column
    column :title
    column :status
    column :published_at
    actions
  end

  form do |f|
    f.inputs do
      f.semantic_errors
      f.input :title
      f.input :content
      f.input :status
    end
    f.actions
  end
end
