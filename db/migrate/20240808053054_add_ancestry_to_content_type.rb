class AddAncestryToContentType < ActiveRecord::Migration[7.1]
  def change
    add_column :content_types, :ancestry, :string
    add_index :content_types, :ancestry
  end
end
