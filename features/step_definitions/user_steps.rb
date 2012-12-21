### UTILITY METHODS ###
#encoding: utf-8
def create_visitor
  @visitor ||= { :login => "Testy McUserton",
    :password => "please", :password_confirmation => "please" }
end

def create_auditor
  @auditor||= {:login => "Testy Auditor",
    :password => "please123", :password_confirmation => "please123" }
end

def find_user
  @user ||= User.where(:login => @visitor[:login]).first
end


def create_user
  create_visitor
  delete_user
  @user ||= FactoryGirl.create(:user, login: @visitor[:login])
end

def create_admin
  @admin ||= FactoryGirl.create(:auditor, login: @auditor[:login])
end

def delete_user
  @user ||= User.where(:login => @visitor[:login]).first
  @user.destroy unless @user.nil?
end

def sign_up
  delete_user
  visit '/users/sign_up'
  fill_in "user_name", :with => @visitor[:name]
  fill_in "user_email", :with => @visitor[:email]
  fill_in "user_password", :with => @visitor[:password]
  fill_in "user_password_confirmation", :with => @visitor[:password_confirmation]
  click_button "Sign up"
  find_user
end

def sign_in
  visit '/users/sign_in'
  fill_in "user_login", :with => @visitor[:login]
  fill_in "user_password", :with => @visitor[:password]
  click_button "Sign in"
end






### GIVEN ###
Given /^I am not logged in$/ do
  visit '/users/sign_in'
end

Given /^I am logged in$/ do
  create_user
  sign_in
end

Given /^I exist as a user$/ do
  create_user
end

Given /^I do not exist as a user$/ do
  create_visitor
  delete_user
end






### WHEN ###
When /^I sign in with valid credentials$/ do
  create_visitor
  sign_in
end

When /^I sign out$/ do
  visit '/users/sign_out'
end

When /^I sign up with valid user data$/ do
  create_visitor
  sign_up
end


When /^I sign up without a password confirmation$/ do
  create_visitor
  @visitor = @visitor.merge(:password_confirmation => "")
  sign_up
end

When /^I sign up without a password$/ do
  create_visitor
  @visitor = @visitor.merge(:password => "")
  sign_up
end


When /^I click on the link "(.*?)"$/ do |owner_link|
  page.has_content?('Please enter data')
  click_link(:owner_link)
end



  # fill_in "water_info_number_flat", :with => 100
  # fill_in "water_info_water_wc", :with => 50
  # fill_in "water_info_water_kitchen", :with => 60



### THEN ###
Then /^I should be signed in$/ do
  page.has_content?("Logout.")
  page.has_no_selector?"Sign up"
  page.has_no_selector?"Login"
end

Then /^I see a successful sign in message$/ do
  page.has_content?("Signed in successfully.") 
end

Then /^I see a owner_link page$/ do
  visit link_water_info_path
end

Then /^I should see a page of data entry$/ do 
  visit new_water_info_path
end

Then /^I should see "(.*?)"$/ do |text|
  page.has_content?(text)
end


# Then /^I enter the data$/ do
    # fill_in "water_info_number_flat", :with => '100'
#   fill_in "water_info_water_kitchen", :with => '50'
#   fill_in "water_info_water_wc", :with => '60'
# end

