class RemoveCityAndStateFromUsers < ActiveRecord::Migration
  def change
  	remove_column :users, :city, :string
  	remove_column :users, :state, :string
  end
end
