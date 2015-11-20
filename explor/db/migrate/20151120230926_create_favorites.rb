class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.text :type
      t.string :title
      t.references :user, index: true, foreign_key: true
      t.references :location, index: true, foreign_key: true
      t.text :img
      t.text :vicinity
      t.text :place_id
      t.integer :price_level
      t.float :rating

      t.timestamps null: false
    end
  end
end
