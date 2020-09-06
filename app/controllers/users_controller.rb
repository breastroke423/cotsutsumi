class UsersController < ApplicationController

  def index
    @users = User.where.not(id: current_user.id)
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
    @wastes = Waste.where(user_id: @user.id)
    @user_total_price = 0
    @wastes.each do |waste|
      sub_total = waste.price * waste.count
      @user_total_price+=sub_total
    end
    @user_difference_price = @user_total_price - @user.purchase_price
  end

  def follows
    @users = current_user.followings
  end

  def followers
    @users = current_user.followers
  end


  private
  def user_params
    params.require(:user).permit(:nickname, :profile_image, :introduction)
  end
end
