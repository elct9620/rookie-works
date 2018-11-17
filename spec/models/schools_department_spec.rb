# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SchoolsDepartment, type: :model do
  it { should belong_to(:department) }
  it { should belong_to(:school) }
end
