class CheersController < ApplicationController
  def create
    @want = Want.find(params[:want_id])
    cheer = current_user.cheers.new(want_id: @want.id)
    cheer.save
  end

  def destroy
    @want = Want.find(params[:want_id])
    cheer = current_user.cheers.find_by(want_id: @want.id)
    cheer.destroy
  end


end
