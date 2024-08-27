class CreateSubjects < ActiveRecord::Migration[7.1]
  def change
    create_table :subjects do |t|
      t.string :title
      t.text :description
      t.string :public_uid
      t.string :state
      t.string :ancestry

      t.timestamps
    end
  end
end
