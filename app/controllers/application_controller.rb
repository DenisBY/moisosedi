class ApplicationController < ActionController::Base
  protect_from_forgery

  def after_sign_in_path_for(resource)
    unless resource.role == "admin"
      link_water_info_path
    else
      auditor_water_info_path
    end
  end

end
