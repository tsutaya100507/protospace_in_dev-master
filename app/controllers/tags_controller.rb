class TagsController < ApplicationController
before_action :group_tags, only: [:index, :show]
before_action :set_prototype, only: [:index, :show]

  def index
    @prototypes = Prototype.all.page(params[:page]).per(5)
  end

  def show
    @tag = Tag.find(params[:id])
    @user = User.find(params[:id])
  end

  def new
    @tag = Tag.new(tag_params)
  end

private
  def group_tags
    @tags = Tag.group(:title).count
  end
  def set_prototype
    @prototype = Prototype.find(params[:id])
  end
end
