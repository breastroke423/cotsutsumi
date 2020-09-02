class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
  end

  def update
  end

  def edit
  end



  def mypage
    @user = current_user
  end

  private
  def user_params
    params.require(:user).permit(:name, :price, :reason)
  end
end
