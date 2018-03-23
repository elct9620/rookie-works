# frozen_string_literal: true

ActiveAdmin.register SchoolsDepartment do
  includes :school, :department
  permit_params :school_id, :department_id
end
