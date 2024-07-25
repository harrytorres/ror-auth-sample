class CreateProfiles < ActiveRecord::Migration[7.1]
  def change
    create_table :profiles do |t|
      t.references :user, null: false, foreign_key: true
      t.string :public_uid, null: false

      t.timestamps
    end

    add_index :profiles, :public_uid, unique: true
  end
end
