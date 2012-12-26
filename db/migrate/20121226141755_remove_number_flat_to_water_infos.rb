class RemoveNumberFlatToWaterInfos < ActiveRecord::Migration
  def up
    remove_column :water_infos, :number_flat
  end

  def down
    add_column :water_infos, :number_flat, :integer
  end
end
