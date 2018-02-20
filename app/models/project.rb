# frozen_string_literal: true

class Project < ApplicationRecord
  # TODO: Add validator to verify school and department relation
  belongs_to :department
  belongs_to :school
  belongs_to :user

  validates :name, :description, :exhibition_year, presence: true

  # TODO: Add all support years
  enum exhibition_year: {
    2018 => 2018
  }
end
