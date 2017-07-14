class AddStoryReferenceToPhotos < ActiveRecord::Migration[5.1]
  def change
    add_reference :photos, :story, foreign_key: true
  end
end
