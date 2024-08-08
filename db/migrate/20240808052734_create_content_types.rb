class CreateContentTypes < ActiveRecord::Migration[7.1]
  def change
    create_table :content_types do |t|
      t.string :state
      t.string :name
      t.string :description

      t.timestamps
    end
  end
end
