class Status < ActiveRecord::Migration
  def change
  	add_column :favorites, :status, :boolean
  end
end
