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
      redirect_to wants_path
    else
      @user = current_user
      flash.now[:alert] = "必要内容の入力を"
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
    flash[:notice] = "削除しました"
    redirect_to wants_path
  end

# ↓全体表示させるかさせないか、のメソッド
  def hide
    @want = Want.find(params[:id])
    @want.update(is_deleted: "t")
  end

  def reveal
    @want = Want.find(params[:id])
    @want.update(is_deleted: "f")
  end



  private
  def want_params
    params.require(:want).permit(:name, :price, :reason, :want_image, :want_image_id)
  end
end
