class RemoveColumsFromUser < ActiveRecord::Migration[7.1]
  def change
    remove_column :users, :mobile, :integer
    remove_column :users, :address, :string
    remove_column :users, :name, :string
  end
end
