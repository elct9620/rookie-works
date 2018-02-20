# frozen_string_literal: true

class Project < ApplicationRecord
  belongs_to :department
  belongs_to :school
  belongs_to :user

  validates :name, :description, :exhibition_year, presence: true
  validates :department, inclusion: { in: ->(p) { p.school.departments } }

  # TODO: Add all support years
  enum exhibition_year: {
    2018 => 2018
  }
end
