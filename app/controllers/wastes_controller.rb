class WastesController < ApplicationController

  def index
  end

  def show
  end

  def new
    @waste = Waste.new
  end

  def edit
  end

  def create
    @waste = Waste.new(waste_params)
    @waste.user_id = current_user.id
    if @waste.save!
      # saving がないから登録できない(Validation failed: Saving must exist):
      redirect_to root_path
    else
      render 'new'
    end
  end

private
  def waste_params
  params.require(:waste).permit(:name, :price, :reason)
  end

end
