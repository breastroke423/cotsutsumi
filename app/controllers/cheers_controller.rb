class CheersController < ApplicationController
  def create
    @want = Want.find(params[:want_id])
    cheer = current_user.cheers.new(want_id: @want.id)
    cheer.save
        redirect_back(fallback_location: root_path)

  end

  def destroy
    @want = Want.find(params[:want_id])
    cheer = current_user.cheers.find_by(want_id: @want.id)
    cheer.destroy
    redirect_back(fallback_location: root_path)
  end


end
