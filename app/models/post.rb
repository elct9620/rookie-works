# frozen_string_literal: true

class Post < ApplicationRecord
  has_many :comments, as: :commentable, inverse_of: :commentable,
                      dependent: :destroy

  mount_uploader :thumbnail, PostThumbnailUploader

  validates :title, :content, presence: true

  enum category: {
    announcement: 0,
    experience: 1,
    column: 2
  }

  enum status: {
    draft: 0,
    reviewing: 1,
    published: 2,
    deleted: 3
  }

  scope :latest, -> { order(published_at: :desc) }

  before_save :set_publish_time
  after_update :notify_user_published
  after_commit :notify_reviewer, on: :create

  private

  def set_publish_time
    return unless status_changed?
    return unless published?

    self.published_at = Time.zone.now
  end

  def notify_user_published
    return unless experience?
    return unless saved_change_to_published_at?
    return if published_at.nil?

    ExperienceMailer.notify_published(self).deliver_now
  end

  def notify_reviewer
    return unless experience?

    ExperienceMailer.notify_review(self).deliver_now
  end
end
