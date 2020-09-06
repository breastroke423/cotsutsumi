class WantsController < ApplicationController

  def index
    @user = current_user
    @want = Want.new
    @wants = current_user.wants.all
    # @wants = Want.all
  end

  def show
    @want = Want.find(params[:id])
  end

  def edit
    # @user = current_user

  end

  def create
    @want = Want.new(want_params)
    @want.user_id = current_user.id
    if @want.save
      redirect_to wants_path
    else
      render 'new'
    end
  end


  def purchase
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
      render 'edit'
    end

  end

  def destroy
    want = Want.find(params[:id])
    want.destroy
    redirect_to wants_path
  end



  private
  def want_params
    params.require(:want).permit(:name, :price, :reason, :want_image)
  end
end
