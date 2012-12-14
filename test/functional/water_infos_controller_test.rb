require 'test_helper'

  class WaterInfosControllerTest < ActionController::TestCase
    include Devise::TestHelpers

    def setup 
      @request.env["devise.mapping"] = Devise.mappings[:user]
      sign_in FactoryGirl.create(:user)
    end



    test "link" do
      get :link
      assert_response :success
    end

    test "auditor" do
      get :auditor
      assert_response :success
    end



    test "should route to water_info/new" do
      assert_routing '/water_infos/new', { :controller => "water_infos", :action => "new" }
    end

    test "should route to water_info/auditor" do
      assert_routing '/water_infos/auditor', { :controller => "water_infos", :action => "auditor" }
    end



    test "link should render correct template and layout" do
      get :link
      assert_template :link
      assert_template :layout => "layouts/application"
    end

    test "auditor should render correct template and layout" do
      get :auditor
      assert_template :auditor
      assert_template :layout => "layouts/application"
    end
  end

  
  # test "should get index" do
  #   get :index
  #   assert_response :success
  #   assert_not_nil assigns(:water_infos)
  # end

  

#   test "should create water_info" do
#     assert_difference('WaterInfo.count') do
#       post :create, water_info: { cons: @water_info.cons, mont: @water_info.mont, number_flat: @water_info.number_flat, user_id: @water_info.user_id, water_kitchen: @water_info.water_kitchen, water_wc: @water_info.water_wc }
#     end

#     assert_redirected_to water_info_path(assigns(:water_info))
#   end

#   test "should show water_info" do
#     get :show, id: @water_info
#     assert_response :success
#   end

#   test "should get edit" do
#     get :edit, id: @water_info
#     assert_response :success
#   end

#   test "should update water_info" do
#     put :update, id: @water_info, water_info: { cons: @water_info.cons, mont: @water_info.mont, number_flat: @water_info.number_flat, user_id: @water_info.user_id, water_kitchen: @water_info.water_kitchen, water_wc: @water_info.water_wc }
#     assert_redirected_to water_info_path(assigns(:water_info))
#   end

#   test "should destroy water_info" do
#     assert_difference('WaterInfo.count', -1) do
#       delete :destroy, id: @water_info
#     end

#     assert_redirected_to water_infos_path
#   end

