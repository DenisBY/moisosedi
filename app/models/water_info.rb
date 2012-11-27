class WaterInfo < ActiveRecord::Base
  attr_accessible :cons, :mont, :number_flat, :user_id, :water_kitchen, :water_wc
  belongs_to :user

  def get_previos
    WaterInfo.where('id != ? and user_id = ?', self.id, self.user_id).where('mont < ?', self.mont).order('mont DESC').first
  end

end
