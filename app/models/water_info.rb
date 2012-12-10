#encoding: utf-8
class WaterInfo < ActiveRecord::Base
  attr_accessible :cons, :mont, :number_flat, :user_id, :water_kitchen, :water_wc

  #relations 

  belongs_to :user

  #validation

  validates :water_wc, :numericality => { :greater_than_or_equal_to => -> wi {wi.user.water_infos.order('created_at DESC').first.water_wc}, :only_integer => true }, :presence => true
  validates :water_kitchen, :numericality => { :greater_than_or_equal_to => -> wi {wi.user.water_infos.order('created_at DESC').first.water_kitchen}, :only_integer => true }, :presence => true
  validates :number_flat, :presence => true, :numericality => {:greater_than => 0}
  
  # validate :check_month

  def self.get_last
    order('created_at DESC').first
  end

  def cons type, prev_value
    unless self[type].blank?
      update_attribute("kons_#{type.first}", self[type] - prev_value)
    end
  end

  def get_previos
    WaterInfo.where('id != ? and user_id = ?', self.id, self.user_id).where('mont < ?', self.mont).order('mont DESC').first
  end
  
 private
  def check_month
    user = self.user
    if user.water_infos.order(:created_at).last.created_at.month == Date.today.month
      errors.add :base, "Вы уже вводили информацию в этом месяце"
    end
  end
end
