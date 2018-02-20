# frozen_string_literal: true

class School < ApplicationRecord
  has_many :schools_departments, dependent: :nullify
  has_many :departments, through: :schools_departments

  validates :name, presence: true
end
