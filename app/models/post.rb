# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :user

  enum category:  {
    announcement: 0,
    experience:   1,
    column:       2
  }

  enum status: {
    draft:     0,
    reviewing: 1,
    published: 2,
    deleted:   3
  }

  scope :latest, -> { order(published_at: :desc) }

  before_save :set_publish_time

  private

  def set_publish_time
    return unless status_changed?
    return unless published?
    self.published_at = Time.zone.now
  end
end