class TagsController < ApplicationController

  def index
  end

  def show
  end

private
  def tags_params
    params.require(:tag).permit(:name, user_ids: [])
  end

  def set_tag
    @prototype = Tag.find(params[:id])
  end
end
