class ContentType < ApplicationRecord
  has_ancestry
  validates :name, presence: true
  validates :description, presence: true
  validates :public_uid, presence: true, uniqueness: true
  validates :state, presence: true
  before_validation :set_uuid, on: :create
  
  state_machine :state, initial: :active do
    event :activate do
      transition new: :active
    end
    
    event :publish do
      transition active: :published
    end

    event :unpublish do
      transition published: :active
    end
  end


  private 

  def set_uuid
    loop do
      self.public_uid ||= SecureRandom.uuid
      break unless ContentType.exists?(public_uid: public_uid)
    end
  end
  
end
