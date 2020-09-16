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

# 部分テンプレート用
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


def count_down
  @waste = Waste.find(params[:waste])
  @waste.count = @waste.count - 1
  @waste.save

# 部分テンプレート用
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

def update
  @waste = Waste.find(params[:id])
  if @waste.update(waste_params)
    redirect_to wastes_path
  else
    @user = current_user
    render 'index'
  end
end

def hide
  @waste = Waste.find(params[:id])
  @waste.update(status: "1")
  redirect_to wastes_path
end

def reveal
  @waste = Waste.find(params[:id])
  @waste.update(status: "0")
  redirect_to wastes_path
end

def hide_away
  @waste = Waste.find(params[:id])
  @waste.update(status: "2")
  redirect_to wastes_path
end



private
def waste_params
  params.require(:waste).permit(:name, :price, :reason)
end

end
