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
require 'factory_girl'


class WaterInfoTest < ActiveSupport::TestCase

  def setup
    @w = FactoryGirl.create(:water_info)
  end

  test "save_water_info" do
    assert @w.valid?, @w.errors.full_messages.to_s
  end

  test "number_flat" do
    @w.number_flat = nil
    assert !@w.save, @w.errors.full_messages.to_s
    @w.number_flat = 'nil'
    assert !@w.save, @w.errors.full_messages.to_s
    @w.number_flat = -1
    assert !@w.save, @w.errors.full_messages.to_s
    @w.number_flat = 1.1
    assert !@w.save, @w.errors.full_messages.to_s
  end


  test "water_kitchen" do
    @w.water_kitchen = nil
    assert !@w.save, @w.errors.full_messages.to_s
    @w.number_flat = 'nil'
    assert !@w.save, @w.errors.full_messages.to_s
  end

  test "water_wc" do
    @w.water_wc = nil
    assert !@w.save, @w.errors.full_messages.to_s
    @w.number_flat = 'nil'
    assert !@w.save, @w.errors.full_messages.to_s
  end
end