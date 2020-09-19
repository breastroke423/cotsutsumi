class HomesController < ApplicationController

  def top
    if user_signed_in?
      @users = User.where.not(id: current_user.id)
    else
      @users = User.all
    end

# 特定のユーザーの無駄遣いの合計を計算
    @wastes = Waste.all
    @user_total_price = 0
    @wastes.each do |waste|
      waste_total = waste.price * waste.count
      @user_total_price+=waste_total
    end

# 全ユーザーの無駄遣いの合計を求める
    @user_all = User.all
    @users_wastes_all = 0
    @user_all.each do |user|
      user.wastes.each do |waste|
        waste_all_total = waste.price * waste.count
        @users_wastes_all+=waste_all_total
      end
    end

# 全ユーザーの目標達成額を計算する
    @users_purchase_all = 0
    @user_all.each do |user|
      @users_purchase_all+=user.purchase_price
    end
  end

  def about
  end

end
