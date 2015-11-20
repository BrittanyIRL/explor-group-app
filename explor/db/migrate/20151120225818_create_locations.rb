class CreateLocations < ActiveRecord::Migration
  def change
    create_table :locations do |t|
      t.string :name
      t.text :img
      t.text :desc

      t.timestamps null: false
    end
  end
end
