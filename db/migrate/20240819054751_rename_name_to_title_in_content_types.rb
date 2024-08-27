class RenameNameToTitleInContentTypes < ActiveRecord::Migration[7.1]
  def change
    rename_column :content_types, :name, :title
  end
end
