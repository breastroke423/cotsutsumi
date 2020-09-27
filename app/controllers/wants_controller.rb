class WantsController < ApplicationController
  before_action :authenticate_user!

  def index
    @user = current_user
    @want = Want.new
    @wants = current_user.wants.all
    # @wants = Want.all
  end

  def show
    @want = Want.find(params[:id])
  end

  def create
    @want = Want.new(want_params)
    @wants = current_user.wants.all
    @want.user_id = current_user.id
    if @want.save
# 非同期の時
      if request.xhr?
        @row_number = params[:want][:row_number]
        render status: :created
      else
        redirect_to wants_path
      end

    else
      @want.want_image = nil
      @user = current_user
      render 'index'
    end
  end


  def purchase # 目標達成／購入のページ用
    @user = current_user
    @want = Want.find(params[:want_id])
    @user.purchase_price = @user.purchase_price + @want.price
    @user.save
    redirect_to achievement_path
  end

  def update
    @want = Want.find(params[:id])
    if @want.update(want_params)
      redirect_to wants_path
    else
      @user = current_user
      render 'index'
    end
  end

  def destroy
    want = Want.find(params[:id])
    want.destroy
    flash[:destroy] = "削除しました"
    redirect_to wants_path
  end

# ↓全体表示させるかさせないか、のメソッド
  def hide
    @want = Want.find(params[:id])
    @want.update(status: 1)
  end

  def reveal
    @want = Want.find(params[:id])
    @want.update(status: 0)
  end



  private
  def want_params
    params.require(:want).permit(:name, :price, :reason, :want_image, :want_image_id)
  end
end
