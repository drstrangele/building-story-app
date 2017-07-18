class AddMainPhotoColumnToBuildings < ActiveRecord::Migration[5.1]
  def change
    add_column :buildings, :main_photo, :string
  end
end
