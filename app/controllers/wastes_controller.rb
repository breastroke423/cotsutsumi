class WastesController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @waste = Waste.new
  end

  def create
    @waste = Waste.new(waste_params)
    @waste.user_id = current_user.id
    if @waste.save
      redirect_to wastes_path
    else
      @user = current_user
      render 'index'
    end
  end

  def count_up
    @waste = Waste.find(params[:waste])
    @waste.count = @waste.count + 1
    @waste.save
    flash.now[:gain] = "すばらしい！！"

# 〜〜部分テンプレート用〜〜
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
# 〜〜部分テンプレート用〜〜
end


def count_down
  @waste = Waste.find(params[:waste])
  @waste.count = @waste.count - 1
  @waste.save
  flash.now[:lose] = "今回はご褒美！"

# 〜〜部分テンプレート用〜〜
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

# 全ユーザーの目標達成購入額@users_purchase_all = 0
@users_purchase_all = 0
@user_all.each do |user|
  @users_purchase_all+=user.purchase_price
end
# 〜〜部分テンプレート用〜〜
end


def update
  @waste = Waste.find(params[:id])
  if @waste.update(waste_params)
    redirect_to wastes_path
  else
    @user = current_user
    render 'index'
  end
end

# ↓全体表示させるかさせないか削除してしまうか
def hide
  @waste = Waste.find(params[:id])
  @waste.update(status: 1)
  redirect_to wastes_path
end

def reveal
  @waste = Waste.find(params[:id])
  @waste.update(status: 0)
  redirect_to wastes_path
end

def hide_away
  @waste = Waste.find(params[:id])
  @waste.update(status: 2)
  flash[:hide] = "削除しました"
  redirect_to wastes_path
end



private
def waste_params
  params.require(:waste).permit(:name, :price, :reason)
end

end
