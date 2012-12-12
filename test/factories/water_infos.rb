# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :water_infos do
    id 1
    number_flat 2
    mont 2012-8-16
    # water_wc 20
    # user_id 1
    # water_kitchen 25
    # kons_w 20
    # kons_k 25

    created_at Time.now      
    updated_at Time.now
  end
end

