class Task < ApplicationRecord

  validates :title, presence: true
  validates :title, uniqueness: true
  validates :title, exclusion: { in: %w(Apple Microsoft Sony) }

end
