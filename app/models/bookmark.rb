# frozen_string_literal: true

class Bookmark < ApplicationRecord
  belongs_to :user
  belongs_to :project

  validates :project, uniqueness: { scope: :user }
end
