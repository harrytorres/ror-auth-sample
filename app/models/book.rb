class Book < ApplicationRecord
  belongs_to :user

  validates :title, :author, :publication_year, presence: true
  validates :publication_year, numericality: { only_integer: true }
  validates :public_uid, presence: true, uniqueness: true
  validates :user, presence: true
  
  generate_public_uid

end
