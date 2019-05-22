class AddLongitudeAndLatitudeToStorages < ActiveRecord::Migration[5.2]
  def change
    add_column :storages, :longitude, :float
    add_column :storages, :latitude, :float
  end
end
