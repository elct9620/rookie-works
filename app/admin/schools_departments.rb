# frozen_string_literal: true

ActiveAdmin.register SchoolsDepartment do
  menu parent: I18n.t('admin.menu.school_config')

  includes :school, :department
  permit_params :school_id, :department_id
end
