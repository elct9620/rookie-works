# frozen_string_literal: true

class Exhibition < ApplicationRecord
  has_many :exhibitions_projects, dependent: :destroy
  has_many :projects, through: :exhibitions_projects

  validates :name, :year, presence: true
end
