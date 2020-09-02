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
    @waste.saving.id = current_user.id.saving
    if @waste.save
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
