class AddPublicUidToBook < ActiveRecord::Migration[7.1]
  def change
    add_column :books, :public_uid, :string
    add_index  :books, :public_uid, unique: true
  end
end
