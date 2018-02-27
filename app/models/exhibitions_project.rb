# frozen_string_literal: true

class ExhibitionsProject < ApplicationRecord
  belongs_to :exhibition
  belongs_to :project
end
