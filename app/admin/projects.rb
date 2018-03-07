# frozen_string_literal: true

ActiveAdmin.register Project do
  permit_params :name, :description, :school, :department, :website

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
    end
    f.actions
  end
end