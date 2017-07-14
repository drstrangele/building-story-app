class AddBuildingReferenceToStories < ActiveRecord::Migration[5.1]
  def change
    add_reference :stories, :building, foreign_key: true
  end
end
