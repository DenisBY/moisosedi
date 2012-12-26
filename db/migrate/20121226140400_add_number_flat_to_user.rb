class AddNumberFlatToUser < ActiveRecord::Migration
  def change
    add_column :users, :number_flat, :integer
  end
end
