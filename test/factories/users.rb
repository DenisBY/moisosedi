# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  flat                   :integer
#  owner                  :string(255)
#  contacts               :string(255)
#  houses_id              :integer
#  square                 :string(255)
#  role                   :string(255)
#  email                  :string(255)
#  login                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0)
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

FactoryGirl.define do 
  factory :user do |u|
    u.login 'login'
    u.password 'password'
    u.password_confirmation 'password'
    u.houses_id { |h| h.association(:house) }
    factory :auditor do |u|
      u.role 'admin'
    end
  end 
end