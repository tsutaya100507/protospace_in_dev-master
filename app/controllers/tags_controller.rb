class TagsController < ApplicationController

  def index
    @tags = Tag.all
  end

  def show
  end

  def new
    @tag = Tag.new(tag_params)
  end


end
