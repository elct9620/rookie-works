# frozen_string_literal: true

class Experience < Post
  belongs_to :user

  default_scope -> { experience }
end
