# frozen_string_literal: true

class Department < ApplicationRecord
  has_many :schools_departments, dependent: :destroy
  has_many :schools, through: :schools_departments

  validates :name, presence: true
end
