class FixingType < ActiveRecord::Migration
  def change
  	rename_column :favorites, :type, :categories
  	rename_column :users, :password, :password_digest
  end
end
