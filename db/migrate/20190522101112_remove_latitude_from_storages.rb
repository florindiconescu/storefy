class RemoveLatitudeFromStorages < ActiveRecord::Migration[5.2]
  def change
    remove_column :storages, :latitude
  end
end
