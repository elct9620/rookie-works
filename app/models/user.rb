# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :projects, dependent: :destroy
  has_many :games, through: :projects, source: :result, source_type: 'Game'

  has_many :posts, dependent: :destroy
  has_many :bookmarks, dependent: :destroy

  def name
    email.split('@').first
  end

  def avatar_url(size = 100)
    hash = Digest::MD5.hexdigest(email)
    "https://www.gravatar.com/avatar/#{hash}?s=#{size}"
  end
end
