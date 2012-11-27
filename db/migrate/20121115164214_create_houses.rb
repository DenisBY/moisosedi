class CreateHouses < ActiveRecord::Migration
  def change
    create_table :houses do |t|
      t.integer :id
      t.string :address

      t.timestamps
    end
  end
end
