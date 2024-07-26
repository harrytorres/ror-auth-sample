class User < ApplicationRecord
  has_one :profile
  has_many :book, dependent: :destroy

  validates :name, presence: true
  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/ }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
  validates :admin, inclusion: { in: [true, false] }
  validates :public_uid, presence: true, uniqueness: true

  generate_public_uid

  accepts_nested_attributes_for :profile
  accepts_nested_attributes_for :book
  
  before_validation :assign_public_uid, on: :create
  after_create :create_profile
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  scope :admins, -> { where(admin: true) }    

  def create_profile
    Profile.create(user: self)
  end

  private 
  
  def assign_public_uid
    self.public_uid ||= SecureRandom.uuid
  end
end
