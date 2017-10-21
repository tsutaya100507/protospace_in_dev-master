class TagsController < ApplicationController

  def index
  end

  def show
  end

  def new
    @tag = Tag.new(tag_params)
  end


end
