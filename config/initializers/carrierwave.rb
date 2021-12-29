# frozen_string_literal: true

CarrierWave.configure do |config|
  config.asset_host = 'https://rookie.works' if Rails.env.production?
  config.asset_host = 'https://beta.rookie.works' if Rails.env.staging?

  # TODO: Replace CarrierWave to ActiveStorage
  config.enable_processing = false if Rails.env.test?
end
