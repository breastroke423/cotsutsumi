class RelationshipsController < ApplicationController


  def create
    @user = User.find(params[:user_id])
    follow = current_user.active_relationships.build(follower_id: params[:user_id])
    respond_to do |format|
      follow.save
    format.js
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    follow = current_user.active_relationships.find_by(follower_id: params[:user_id])
    follow.destroy
    respond_to do |format|
      follow.destroy
    format.js
  end
end

end