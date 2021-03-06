class User < ApplicationRecord

  has_secure_password

  has_many :favourites, dependent: :destroy
  has_many :favourited_projects, through: :favourites, source: :project

  has_many :memberships, dependent: :destroy
  has_many :member_projects, through: :memberships, source: :project

  def full_name
    "#{first_name} #{last_name}"
  end

end
