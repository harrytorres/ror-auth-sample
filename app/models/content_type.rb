class ContentType < ApplicationRecord
  has_ancestry
  validates :name, presence: true
  validates :description, presence: true
  validates :public_uid, presence: true, uniqueness: true
  validates :state, presence: true
  generate_public_uid generator: PublicUid::Generators::NumberRandom.new

  state_machine :state, initial: :active do
    event :activate do
      transition inactive: :active
    end
    event :publish do
      transition active: :published
    end
    event :unpublish do
      transition publish: :active
    end
  end

  validate :can_be_published?, if: :publishing?

  private 

  def publishing?
    state_changed? && state == 'published'
  end
  
  def can_be_published?
    errors.add(:state, "can only be published if active") unless state_was == 'active'
  end
  
end
