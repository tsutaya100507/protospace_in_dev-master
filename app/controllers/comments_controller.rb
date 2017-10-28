class CommentsController < ApplicationController
  before_action :comment_params, only: [:create]

  def create
    @comment = Comment.create(text: comment_params[:text], prototype_id: comment_params[:prototype_id], user_id: current_user.id)
    respond_to do |format|
      format.html { redirect_to prototype_path(params[:prototype_id])  }
      format.json
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:text).merge(user_id: params[:user_id])
  end
end
