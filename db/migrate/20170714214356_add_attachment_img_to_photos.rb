class AddAttachmentImgToPhotos < ActiveRecord::Migration
  def self.up
    change_table :photos do |t|
      t.attachment :img
    end
  end

  def self.down
    remove_attachment :photos, :img
  end
end
