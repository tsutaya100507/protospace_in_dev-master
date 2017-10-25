class PrototypesController < ApplicationController
  before_action :set_prototype, only: [:show, :edit, :update]

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
        redirect_to :root, notice: 'New prototype was successfully created'
      else
        redirect_to :root, alert: 'YNew prototype was unsuccessfully created'
    end
  end

  def show
  end

  def edit
   @main = @prototype.captured_images.where(status: 0).first
   @sub = @prototype.captured_images.where(status: 1)
  end

  def update
    @prototype.update(prototype_params)
    redirect_to :root
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
      captured_images_attributes: [:id, :content, :status],
      tags_attributes: [:title]
      )
  end
end
