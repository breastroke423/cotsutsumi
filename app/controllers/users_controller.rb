class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
  end

  def update
    @user = current_user
    @user.update(user_params)
    redirect_to mypage_path


  end

  def edit
    @user = current_user
  end


  def achievement
  end



  def mypage
    @user = current_user
    # @sum = current_user.wastes.price * current_user.wastes.count
  end


  private
  def user_params
    params.require(:user).permit(:nickname, :profile_image, :introduction)
  end
end
