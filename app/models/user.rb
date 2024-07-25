class User < ApplicationRecord
  has_one :profile
  generate_public_uid

  after_create :create_profile
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  scope :admins, -> { where(admin: true) }    

  def self.find_puid(param)
    find_by! public_uid: param.split('-').first
  end
  
  def slug
    name.downcase.gsub(/\s/,'-')
  end

  def to_param
    "#{public_uid}-#{slug}"
  end

  def create_profile
    Profile.create(user: self)
  end
end
