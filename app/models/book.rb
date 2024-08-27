class Book < ApplicationRecord
  resourcify
  belongs_to :user, inverse_of: :book, optional: true

  after_create_commit { broadcast_append_to "books" }
  after_update_commit { broadcast_replace_to "books" }

  validates :title, :author, :publication_year, presence: true
  validates :publication_year, numericality: { only_integer: true }
  validates :public_uid, presence: true, uniqueness: true
  before_validation :set_uuid, on: :create
  
  private 

  def set_uuid
    self.public_uid ||= SecureRandom.uuid
  end
end
