class AddCpassword < ActiveRecord::Migration
  def change
  	add_column :users, :cpassword, :string
  end
end
