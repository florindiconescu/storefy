class AddActiveToStorages < ActiveRecord::Migration[5.2]
  def change
    add_column :storages, :active, :boolean, :default => true
  end
end
