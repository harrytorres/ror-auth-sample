class Profile < ApplicationRecord
  belongs_to :user

  validates :name_must_match_user_name
  validates :email_must_match_user_email
  validates :mobile, :numericality => { :only_integer => true }
  validates :address, :length => { :maximum => 255 }
  validates :public_uid, presence: true, uniqueness: true

  generate_public_uid

  private 

  def name_must_match_user_name
    if user.present? && user.name != name
      errors.add(:name, "must match the name on the user")
    end
  end

  def email_must_match_user_email
    if user.present? && user.email != email
      errors.add(:email, "must match the email on the user")
    end
  end
end
