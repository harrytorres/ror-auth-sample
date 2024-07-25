class AddNewColumnToProfiles < ActiveRecord::Migration[7.1]
  def change
    add_column :profiles, :mobile, :integer
    add_column :profiles, :address, :string
    add_column :profiles, :name, :string
    add_column :profiles, :email, :string

    Profile.reset_column_information
    Profile.find_each do |profile|
      user = User.find(profile.user_id)
      profile.update(name: user.name) if user
      profile.update(email: user.email) if user
    end
  end
end
