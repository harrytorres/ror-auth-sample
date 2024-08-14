class User < ApplicationRecord
  rolify
  has_one :profile, inverse_of: :user
  has_many :book, foreign_key: :user_id, inverse_of: :user, dependent: :destroy

  validates :email, presence: true, uniqueness: true, format: { with: /\A[^@\s]+@[^@\s]+\z/ }
  validates :password, presence: true, length: { minimum: 6 }
  validates :password_confirmation, presence: true
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
  
  state_machine  :state, initial: :new do       
    event :activate do
      transition :new => :active
    end

    event :deactivate do
      transition :active => :inactive
    end 

    event :ban do
      transition [:new, :active, :inactive] => :banned
    end

    event :unban do
      transition :banned => :active
    end
    
  end

  def create_profile
    Profile.create(user: self)
  end

  def as_json(options={})
    super(options.merge({methods: :type}))
  end

  private 
  
  def assign_public_uid
    self.public_uid ||= SecureRandom.uuid
  end
end
