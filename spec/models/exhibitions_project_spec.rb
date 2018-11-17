# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ExhibitionsProject, type: :model do
  it { should belong_to(:exhibition) }
  it { should belong_to(:project) }
end
