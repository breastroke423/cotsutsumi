class UsersController < ApplicationController
  before_action :authenticate_user!, only: [:update, :edit, :achievement, :mypage, :follows, :followers, :hide]

  def index
  # ランダム表示
    if user_signed_in?
      @users = User.where(is_deleted: false).where.not(id: current_user.id).sample(7)
    else
      @users = User.where(is_deleted: false).sample(7)
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

# 自分自身の無駄遣い削減合計
    @user_total_price = 0
    @wastes.each do |waste|
      waste_total = waste.price * waste.count
      @user_total_price+=waste_total
    end

# 現在の積みたて＝今使ってもいい額＝無駄遣い削減合計ー目標達成の購入額
    @user_difference_price = @user_total_price - @user.purchase_price
    @waste_count_all = 0
    @wastes.each do |waste|
      @waste_count_all += waste.count
    end

# 全ユーザーの無駄遣い削減額
    @user_all = User.all
    @users_wastes_all = 0
    @user_all.each do |user|
      user.wastes.each do |waste|
        waste_all_total = waste.price * waste.count
        @users_wastes_all+=waste_all_total
      end
    end

# 全ユーザーの目標達成購入額
    @users_purchase_all = 0
    @user_all.each do |user|
      @users_purchase_all+=user.purchase_price
    end
  end

  def follows
    @users = current_user.followings.where(is_deleted: false).page(params[:page]).per(5)
  end

  def followers
    @users = current_user.followers.where(is_deleted: false).page(params[:page]).per(5)
  end

  def hide # 退会オプション、destroyにしないのは合計額が崩れるから
    @user = User.find(params[:id])
    @user.update(is_deleted: true)
    # default = "f"
    reset_session
    flash[:thanks] = "買いたいものができたときのご利用お待ちしております"
    redirect_to root_path
  end

  def search # 検索用
    if params[:nickname].present?
      @users = User.where('nickname LIKE ?', "%#{params[:nickname]}%").page(params[:page]).per(5)
    else
      @users = User.none.page(params[:page]).per(5)
    end
  end

  private
  def user_params
    params.require(:user).permit(:nickname, :profile_image, :introduction)
  end
end
