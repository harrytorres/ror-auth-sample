class Profile < ApplicationRecord
  belongs_to :user

  validates :first_name, :middle_name, :last_name, :presence => true
  validates :mobile, :numericality => { :only_integer => true }
  validates :address, :length => { :maximum => 255 }
  validates :public_uid, presence: true, uniqueness: true

  generate_public_uid

  private 

 
end
