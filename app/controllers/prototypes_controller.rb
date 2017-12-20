class PrototypesController < ApplicationController
  before_action :set_prototype, only: [:show, :edit, :update, :destroy]

  def index
    @prototypes = Prototype.all.page(params[:page]).per(50)
  end

  def new
    @prototype = Prototype.new
    @prototype.captured_images.build
    @prototype.tags.build
  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save


      tags = []
      tags_params[:tags_attributes].each_value do |hash|
        tags << hash[:title]
      end

      @prototype.save_tags(tags)

      redirect_to :root, notice: 'New prototype was successfully created'
    else
      redirect_to ({ action: new }), alert: 'New prototype was unsuccessfully created'

    end
  end

  def show
  @comment = Comment.new
  end

  def edit
    @main = @prototype.captured_images.where(status: 0).first
    @sub = @prototype.captured_images.where(status: 1)
    @sub_new = Prototype.new
    @tags = @prototype.tags
    @tag_new = Prototype.new
  end

  def update

    if @prototype.update(prototype_params)

      tags = []
      tags_params[:tags_attributes].each_value do |hash|
        tags << hash[:title]
      end
      @prototype.save_tags(tags)

      redirect_to :root
    else
      redirect_to :root
    end

  end

  def destroy
    if prototype.user_id == current_user.id
        prototype.destroy
        redirect_to root_path
    end
  end

  private
  def set_prototype
    @prototype = Prototype.find(params[:id])
  end

  def prototype_params
    params.require(:prototype).permit(
      :title,
      :catch_copy,
      :concept,
      :user_id,
      { :tag_ids => [] },
      captured_images_attributes: [:id, :content, :status, :prototype_id]
    )
  end

  def tags_params
    params.require(:prototype).permit(
      tags_attributes: [:title, :_destroy]
    )
  end
end
