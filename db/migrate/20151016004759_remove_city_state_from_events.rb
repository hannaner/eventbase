class RemoveCityStateFromEvents < ActiveRecord::Migration
  def change
  	remove_column :events, :city, :string
  	remove_column :events, :state, :string
  end
end
