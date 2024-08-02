class Author < User
  has_many :book, inverse_of: :user, dependent: :destroy
  accepts_nested_attributes_for :book

end