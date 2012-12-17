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
