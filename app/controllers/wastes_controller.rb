class WastesController < ApplicationController

  def index
  end

  def show
  end

  def edit
    @user = current_user
    @waste = Waste.new

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

  def count_up
    @waste_count = wastes.count += 1
    @waste_count.update
    redirect_to mypage
  end
  def count_down
    waste.wastes.count += 1
    waste.update
    redirect_to mypage
  end


  def update
    @waste = Waste.find(params[:id])
    if @waste.save
      redirect_to root_path
    else
      render 'edit'
    end
  end



  private
  def waste_params
    params.require(:waste).permit(:name, :price, :reason)
  end

end
