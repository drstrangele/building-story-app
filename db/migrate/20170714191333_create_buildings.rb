class CreateBuildings < ActiveRecord::Migration[5.1]
  def change
    create_table :buildings do |t|
      t.string :name
      t.string :address
      t.decimal :long
      t.decimal :lat
      t.string :description

      t.timestamps
    end
  end
end
