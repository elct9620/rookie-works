# frozen_string_literal: true

class Exhibition < ApplicationRecord
  has_many :exhibitions_projects, dependent: :destroy
  has_many :projects, through: :exhibitions_projects

  validates :name, :year, presence: true

  mount_uploader :plan_image, PlanImageUploader

  def name_with_year
    "#{year} - #{name}"
  end
end
