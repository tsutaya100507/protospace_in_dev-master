class PrototypesController < ApplicationController
  before_action :set_prototype, only: [:show, :edit, :update, :destroy]

  def index
    @prototypes = Prototype.all.page(params[:page]).per(5)
  end

  def new
    @prototype = Prototype.new
    @prototype.captured_images.build
    @prototype.tags.build
  end

  def create

    @prototype = Prototype.new(prototype_params)
    if @prototype.save
      tags_params[:tags_attributes].each_value do |hash|
        tag = Tag.find_or_create_by(title: hash[:title])
        PrototypeTag.create(tag_id: tag.id, prototype_id: @prototype.id)
        tags_params.compact.reject(&:empty?)
      end
      redirect_to :root
    else
      redirect_to :root
    end
  end

  def show

  end

  def edit
   @main = @prototype.captured_images.where(status: 0).first
   @sub = @prototype.captured_images.where(status: 1)
   @sub_new = Prototype.new
  end

  def update
    @prototype.update(prototype_params)
    redirect_to :root
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
      captured_images_attributes: [:id, :content, :status]
      # tags_attributes: [:id, :title]
    )
  end

  def tags_params
    params.require(:prototype).permit(
      tags_attributes: :title
      )
  end
end
