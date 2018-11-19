# frozen_string_literal: true

ActiveAdmin.register Project do
  menu parent: I18n.t('admin.menu.gallery')

  includes :school, :department, :user
  permit_params :name, :description, :school_id, :department_id,
                :website, :video

  index do
    selectable_column
    column :name
    column :school
    column :department
    column :user
    actions
  end

  form do |f|
    f.inputs do
      f.input :name
      f.input :description
      f.input :school
      f.input :department
      f.input :website
      f.input :video
    end
    f.actions
  end
end
