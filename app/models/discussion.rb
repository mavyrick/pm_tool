class Discussion < ApplicationRecord
  belongs_to :project
  has_many :discussions, dependent: :destroy
end
