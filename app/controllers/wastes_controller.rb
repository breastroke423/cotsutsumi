class WastesController < ApplicationController

  def index
    @user = current_user
    @waste = Waste.new
  end

  def show
  end

  def edit
    # @user = current_user
    # @waste = Waste.new

  end

  def create
    @waste = Waste.new(waste_params)
    @waste.user_id = current_user.id
    if @waste.save
      redirect_to wastes_path
    else
      render 'new'
    end
  end

  def count_up
    @waste = Waste.find(params[:waste])
    @waste.count = @waste.count + 1
    @waste.save
    redirect_to mypage_path
  end


  def count_down
    @waste = Waste.find(params[:waste])
    @waste.count = @waste.count - 1
    @waste.save
    redirect_to mypage_path
  end


  def update
    @waste = Waste.find(params[:id])
    if @waste.update(waste_params)
      redirect_to wastes_path
    else
      render 'edit'
    end
  end



  private
  def waste_params
    params.require(:waste).permit(:name, :price, :reason)
  end

end
