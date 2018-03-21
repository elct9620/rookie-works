# frozen_string_literal: true

class Project < ApplicationRecord
  VIDEO_FORMAT =
    %r{\Ahttp[s]?+:\/\/(?:(www|player)\.)?(youtu(be)?|vimeo)(?:\.(be|com)).+\z}

  belongs_to :department
  belongs_to :school
  belongs_to :user
  belongs_to :result, polymorphic: true, inverse_of: :project,
                      dependent: :destroy

  has_many :exhibitions_projects, dependent: :destroy
  has_many :exhibitions, through: :exhibitions_projects

  mount_uploader :thumbnail, ThumbnailUploader

  validates :name, :description, :thumbnail, presence: true
  validates :video, format: { with: VIDEO_FORMAT, allow_blank: true }
  validates :department, inclusion: { in: ->(p) { p.school.departments } }

  def video_type
    return :vimeo if video.include?('vimeo')
    :youtube
  end

  def video_embed_url
    send("#{video_type}_embed_url")
  end

  private

  # TODO: Move into concern
  def youtube_embed_url
    base_url = 'https://www.youtube.com/embed/'
    video_id = if video.include?('watch')
                 URI.decode_www_form(URI(video).query).to_h.fetch('v')
               else
                 video.split('/').last
               end
    "#{base_url}#{video_id}"
  end

  def vimeo_embed_url
    base_url = 'https://player.vimeo.com/video/'
    video_id = video.split('/').last
    "#{base_url}#{video_id}"
  end
end
