#encoding: utf-8
# == Schema Information
#
# Table name: water_infos
#
#  id            :integer          not null, primary key
#  mont          :date
#  number_flat   :integer
#  user_id       :integer
#  water_wc      :integer
#  water_kitchen :integer
#  kons_w        :integer
#  kons_k        :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

class WaterInfo < ActiveRecord::Base
  attr_accessible :cons, :mont, :number_flat, :user_id, :water_kitchen, :water_wc
  belongs_to :user



  

  validates :number_flat, :presence => true, :numericality => { :only_integer => true, :greater_than => 0 }
  validates :water_kitchen, :presence => true, :numericality => { :only_integer => true, :greater_than => 0 }
  validates :water_wc, :presence => true, :numericality => { :only_integer => true, :greater_than => 0 }

  before_validation :check_month

  def check_month
    self.errors.add(:mont, "Вы уже вводили значения в это месяце") if current_user.water_infos.order('created_at DESC').first.mont = self.mont
  end

  # def get_previos
  #   WaterInfo.where('id != ? and user_id = ?', self.id, self.user_id).where('mont < ?', self.mont).order('mont DESC').first
  # end 

end
