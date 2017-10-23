class TagsController < ApplicationController

  def index
    @tags = Tag.all
    @tag = @tags.uniq.pluck(:title)
  end

  def show
  end

  def new
    @tag = Tag.new(tag_params)
  end


end
