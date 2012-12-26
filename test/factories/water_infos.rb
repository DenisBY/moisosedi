# Read about factories at https://github.com/thoughtbot/factory_girl
#encoding: utf-8
FactoryGirl.define do
  factory :water_info do
    mont '2012-01-16'
    water_wc 40
    user_id { |u| u.association(:user) }
    water_kitchen 45
    kons_w 20
    kons_k 25

    created_at Time.now      
    updated_at Time.now
  end
end


FactoryGirl.define do 
  factory :house do |h|
    h.address "Aloloshaplac,3"
  end
end
