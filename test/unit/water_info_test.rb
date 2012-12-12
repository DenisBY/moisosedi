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

require 'test_helper'
#require 'factory_girl'


class WaterInfoTest < ActiveSupport::TestCase

  test "number_flat" do
    #w = FactoryGirl.build(:water_infos)
    w = WaterInfo.new 
    w.number_flat = nil
    assert !w.save, w.errors.full_messages.to_s
    w.number_flat = 'nil'
    assert !w.save, w.errors.full_messages.to_s
    w.number_flat = -1
    assert !w.save, w.errors.full_messages.to_s
    w.number_flat = 1.1
    assert !w.save, w.errors.full_messages.to_s
  end


  test "water_kitchen" do

    w = WaterInfo.new
    w.water_kitchen = nil
    assert !w.save, w.errors.full_messages.to_s
  end
end