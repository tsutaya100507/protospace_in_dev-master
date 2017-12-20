class CommentsController < ApplicationController
  def index
    @comment = Comment.new
  end

  def create
    Comment.create(comment_params)
    @comments = Prototype.find(params[:prototype_id]).comments
  end
end

  private
    def comment_params
      params.require(:comment).permit(:text, :id).merge(prototype_id: params[:prototype_id])
    end
