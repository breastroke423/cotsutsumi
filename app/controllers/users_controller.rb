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
    @sum = @user.wastes.price.to_i * @user.wastes.count.to_i
  end

  def count_up
    @user = current_user
    @user.wastes.count.to_i += 1
    @user.save
    redirect_to mypage
  end
  def count_down
    @user = current_user
    @user.wastes.count.to_i += 1
    @user.save
    redirect_to mypage
  end

  private
  def user_params
    params.require(:user).permit(:name, :price, :reason)
  end
end
