require "attachment_uploader"

class Project < ApplicationRecord

  validates :title, presence: true
  validates :title, uniqueness: true
  validates :title, exclusion: { in: %w(Apple Microsoft Sony) }

  has_many :discussions, dependent: :destroy

  has_many :favourites, dependent: :destroy
  has_many :users, through: :favourites

  has_many :memberships, dependent: :destroy
  has_many :members, through: :memberships, source: :user

  mount_uploader :attachment, AttachmentUploader

  def favourite_for(user)
    favourites.find_by_user_id(user)
  end

  def membership_for(user)
   memberships.find_by_user_id(user)
 end

end
