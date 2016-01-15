class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :name
      t.string :date
      t.string :location
      t.references :location, index: true

      t.timestamps
    end
  end
end
