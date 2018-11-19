# frozen_string_literal: true

class Announcement < Post
  default_scope -> { announcement }

  scope :recent, ->(count = nil) { order(published_at: :desc).limit(count) }
end
