class UpdateProfileTable < ActiveRecord::Migration[7.1]
  def change
    remove_column :profiles, :email, :string

    rename_column :profiles, :name, :first_name
    add_column :profiles, :middle_name, :string
    add_column :profiles, :last_name, :string
  end
end
