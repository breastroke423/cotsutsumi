class WastesController < ApplicationController
  before_action :authenticate_user!
  include ApplicationHelper

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
    count_up_save

    # 〜〜部分テンプレート用〜〜
    @user = current_user
    @wastes = Waste.where(user_id: @user.id)
    calculation_waste_purchase
    # 現在の積みたて＝今使ってもいい額＝無駄遣い削減合計ー目標達成の購入額
    calculation_possible_total
  end

def count_down

  count_down_save
  # 〜〜部分テンプレート用〜〜
  @user = current_user
  @wastes = Waste.where(user_id: @user.id)
  calculation_waste_purchase
  # 現在の積みたて＝今使ってもいい額＝無駄遣い削減合計ー目標達成の購入額
  calculation_possible_total
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
