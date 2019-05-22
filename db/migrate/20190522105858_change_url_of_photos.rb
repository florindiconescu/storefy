class ChangeUrlOfPhotos < ActiveRecord::Migration[5.2]
  def change
    rename_column :photos, :url, :data
  end
end
