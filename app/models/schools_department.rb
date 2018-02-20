# frozen_string_literal: true

class SchoolsDepartment < ApplicationRecord
  belongs_to :school
  belongs_to :department
end
