class ApplicationController < ActionController::Base
before_action :configure_permitted_parameters , if: :devise_controller?

  protected

  def after_sign_in_path_for(resource)
    # sign_upからの時だけリンク先を分けるようにする
    if request.referer&.include?("/users/sign_up")
      wants_path
    else
      mypage_path
    end
  end


  def after_sign_out_path_for(resource)
    root_path
  end


  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :introduction, :profile_image])
  end

end
