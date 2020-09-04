class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def show
  end

  def update
    wastes.count += 1
    waste.save
    redirect_to mypage
  end

  def edit
  end


  def achievement
  end



  def mypage
    @user = current_user
    # @sum = current_user.wastes.price * current_user.wastes.count
  end


  private
  def user_params
    params.require(:user).permit(:name, :price, :reason)
  end
end
