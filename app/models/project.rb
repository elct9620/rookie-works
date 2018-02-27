# frozen_string_literal: true

class Project < ApplicationRecord
  belongs_to :department
  belongs_to :school
  belongs_to :user

  has_many :exhibitions_projects, dependent: :destroy
  has_many :exhibitions, through: :exhibitions_projects

  mount_uploader :thumbnail, ThumbnailUploader

  validates :name, :description, :thumbnail, presence: true
  validates :department, inclusion: { in: ->(p) { p.school.departments } }
end
