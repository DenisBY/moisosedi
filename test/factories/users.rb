FactoryGirl.define do
  factory :user do 
    login 'login'
    password 'password'
    password_confirmation 'password'
    role 'user'
  end
  
  factory :user do 
    login 'login'
    password 'password'
    password_confirmation 'password'
    role 'admin'
  end 
 
end