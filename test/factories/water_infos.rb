# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :water_info do
    number_flat 2
    mont '2012-11-16'
    water_wc 40
    user_id 1
    water_kitchen 45
    kons_w 20
    kons_k 25

    created_at Time.now      
    updated_at Time.now
  end
end

