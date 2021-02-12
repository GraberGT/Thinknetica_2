class ApplicationController < ActionController::Base
  def after_sign_in_path_for(current_user)
    if current_user.admin?
      admin_root_path
    else
      super
    end
  end
end
