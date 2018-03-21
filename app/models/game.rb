# frozen_string_literal: true

class Game < ApplicationRecord
  include HasPlatform

  enum genre: {
    unknown:          0,
    shooter:          1,
    action:           2,
    adventure:        3,
    action_adventure: 4,
    fighting:         5,
    platfomer:        6,
    strategy:         7,
    rpg:              8,
    racing:           9,
    vr:               10,
    puzzle:           11
  }
end
