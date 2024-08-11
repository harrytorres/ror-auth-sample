class AddPublicUidToContentType < ActiveRecord::Migration[7.1]
  def change
    add_column :content_types, :public_uid, :string
    add_index :content_types, :public_uid, unique: true
  end
end
