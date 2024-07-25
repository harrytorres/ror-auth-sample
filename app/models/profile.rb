class Profile < ApplicationRecord
  belongs_to :user
  has_many :book
  generate_public_uid
end
