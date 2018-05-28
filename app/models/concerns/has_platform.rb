# frozen_string_literal: true

module HasPlatform
  extend ActiveSupport::Concern

  PLATFORM = {
    windows:  0b00000001,
    macos:    0b00000010,
    linux:    0b00000100,
    android: 0b00001000,
    ios:      0b00010000
  }.freeze

  included do
    def platform
      PLATFORM.reject do |_key, value|
        (self[:platform].to_i(2) & value).zero?
      end.keys
    end

    def platform=(*args)
      self[:platform] = self.class.platform_to_bit(args.flatten)
    end
  end

  class_methods do
    def platform_is(*platforms)
      bit = platform_to_bit(platforms.flatten)
      where('platform & B? <> 0::bit(8)', bit)
    end

    def platform_to_bit(platforms)
      platforms.reduce(0) do |prev, platform|
        prev | PLATFORM[platform.to_sym].to_i
      end.to_s(2).rjust(8, '0')
    end
  end
end
