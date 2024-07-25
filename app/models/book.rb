class Book < ApplicationRecord
  belongs_to :user
  belongs_to :profile
  generate_public_uid
  
  def show
  end

  def index
  end
end
