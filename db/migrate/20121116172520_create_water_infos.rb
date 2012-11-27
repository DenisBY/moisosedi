class CreateWaterInfos < ActiveRecord::Migration
  def change
    create_table :water_infos do |t|
      t.date :mont
      t.integer :number_flat
      t.integer :user_id
      t.integer :water_wc
      t.integer :water_kitchen
      t.integer :kons_w
      t.integer :kons_k

      t.timestamps
    end
  end
end
