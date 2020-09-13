class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:update, :edit, :achievement, :mypage, :follows, :followers, :hide]

  def index
    if user_signed_in?
      @users = User.where.not(id: current_user.id)
    else
      @users = User.all
    end
    @want = Want.new
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
      waste_total = waste.price * waste.count
      @user_total_price+=waste_total
    end
    @user_difference_price = @user_total_price - @user.purchase_price
    @waste_count_all = 0
    @wastes.each do |waste|
      @waste_count_all += waste.count
    end
    @user_all = User.all
    @users_wastes_all = 0
    @user_all.each do |user|
      user.wastes.each do |waste|
        waste_all_total = waste.price * waste.count
        @users_wastes_all+=waste_all_total
      end
    end
    @users_purchase_all = 0
    @user_all.each do |user|
      @users_purchase_all+=user.purchase_price
    end
  end

  def follows
    @users = current_user.followings
  end

  def followers
    @users = current_user.followers
  end

  def hide
    @user = User.find(params[:id])
    @user.update(is_deleted: "t")
    # default = "f"
    reset_session
    flash[:notice] = "買いたいものができたときのご利用お待ちしております"
    redirect_to root_path
  end

  private
  def user_params
    params.require(:user).permit(:nickname, :profile_image, :introduction)
  end
end
