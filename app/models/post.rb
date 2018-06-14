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
end
