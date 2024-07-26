class AddNewColumnToProfiles < ActiveRecord::Migration[7.1]
  def change
    add_column :profiles, :mobile, :integer
    add_column :profiles, :address, :string
    add_column :profiles, :name, :string
    add_column :profiles, :email, :string
  end
end
