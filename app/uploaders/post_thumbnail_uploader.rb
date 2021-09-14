# frozen_string_literal: true

class PostThumbnailUploader < CarrierWave::Uploader::Base
  # Include RMagick or MiniMagick support:
  # include CarrierWave::RMagick
  include CarrierWave::MiniMagick

  # Choose what kind of storage to use for this uploader:
  # storage :file
  # storage :fog

  # Override the directory where uploaded files will be stored.
  # This is a sensible default for uploaders that are meant to be mounted:
  def store_dir
    "uploads/post/#{mounted_as}/#{model.id}"
  end

  # Provide a default URL as a default if there hasn't been a file uploaded:
  def default_url(*)
    ActionController::Base.helpers.image_url(
      'fallback/' + ['post', version_name, 'default.jpg'].compact.join('_')
    )
  end

  # Process files as they are uploaded:
  # process scale: [200, 300]
  #
  # def scale(width, height)
  #   # do something
  # end

  # Create different versions of your uploaded files:
  version :thumb do
    process resize_to_fill: [570, 384]
  end

  version :medium do
    process resize_to_fill: [860, 520]
  end

  def extension_allowlist
    %w[jpg jpeg gif png]
  end
end
