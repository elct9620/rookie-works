# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Bookmark, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:project) }

  # TODO: Fix uniqueness validator not work
  # it { should validate_uniqueness_of(:project_id).scoped_to(:user_id) }
end
