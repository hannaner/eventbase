class AddDigest < ActiveRecord::Migration
  def change
  	remove_column :users, :password, :string
  	remove_column :users, :cpassword, :string
  	add_column :users, :password, :digest
  end
end
