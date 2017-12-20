class CommentsController < ApplicationController
  def index
    @comment = Comment.new
  end

  def create
    binding.pry
    Comment.create(comment_params)
    @prototype = Prototype.find(params[:id])
    # redirect_to prototype_path(@prototype)
  end
end

  private
    def comment_params
      params.require(:comment).permit(:text, :id).merge(prototype_id: params[:id])
    end
