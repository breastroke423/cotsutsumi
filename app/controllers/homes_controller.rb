class HomesController < ApplicationController
  include ApplicationHelper

  def top
    if user_signed_in?
      @users = User.where(is_deleted: false).where.not(id: current_user.id).sample(3)
      # users where is_deleted = false and id != current_user.id
    else
      @users = User.where(is_deleted: false).sample(3)
    end

    # 特定のユーザーの無駄遣いの合計を計算
    @wastes = Waste.all
    calculation_waste_purchase
    calculation_waste_total

    # 全ユーザーの無駄遣いの合計を求める
    all_user_wast_total

    # 全ユーザーの目標達成額を計算する
    all_user_purchase_total
  end

  def about
  end

end
