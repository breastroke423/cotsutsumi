class WantsController < ApplicationController

  def index
  end

  def edit
  end

  def new
    @want = Want.new
  end

  def create
    @want = Want.new(want_params)
    @want.user_id = current_user.id
    if @want.save!
      redirect_to root_path
    else
      render 'new'
    end
  end

  def update
  end

  private
  def want_params
    params.require(:want).permit(:name, :price, :reason)
  end
end
