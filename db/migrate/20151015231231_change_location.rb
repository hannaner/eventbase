class ChangeLocation < ActiveRecord::Migration
  def change
  	remove_column :users, :location, :string
  	add_column :users, :city, :string
  	add_column :users, :state, :string
  	remove_column :events, :location, :string
  	add_column :events, :city, :string
  	add_column :events, :state, :string
  end
end
