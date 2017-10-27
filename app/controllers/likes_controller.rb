class LikesController < ApplicationController
  def create
    @like = Like.create(user_id: current_user.id, prototype_id: params[:prototype_id])
    @likes = Like.where(prototype_id: params[:prototype_id])
    @captured_images = Captured_image.all
  end

  def destroy
    like = Like.find_by(user_id: current_user.id, rototype_id: params[:rototype_id])
    like.destroy
    likes = like.where(prototype_id: params[:prototype_id])
  end
end
