class WantsController < ApplicationController

  def index
    @user = current_user
    @want = Want.new
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

  def update
    @want = Want.find(params[:id])
    if @want.update
      redirect_to root_path
    else
      render 'edit'
    end

  def destroy
    want = Want.find(params[:id])
    want.destroy!
    redirect_to wants_path
  end

  end

  private
  def want_params
    params.require(:want).permit(:name, :price, :reason)
  end
end
