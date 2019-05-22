class RemoveLongitudeFromStorages < ActiveRecord::Migration[5.2]
  def change
    remove_column :storages, :longitude
  end
end
