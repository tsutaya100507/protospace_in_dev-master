class PrototypesController < ApplicationController
  before_action :set_prototype, only: [:show, :edit, :update]

  def index
    @prototypes = Prototype.all.page(params[:page]).per(50)
  end

  def new
    @prototype = Prototype.new
    @prototype.captured_images.build
<<<<<<< HEAD
    @sub = @prototype.captured_images.where(status: 1)

=======

    @prototype.tags.build

    # @sub = @prototype.captured_images.where(status: 1).first
>>>>>>> master

  end

  def create
    @prototype = Prototype.new(prototype_params)
    if @prototype.save
<<<<<<< HEAD
      redirect_to :root, notice: 'New prototype was successfully created'
    else
      redirect_to ({ action: new }), alert: 'New prototype was unsuccessfully created'
=======
        redirect_to :root, notice: 'New prototype was successfully created'
      else
        redirect_to :root, alert: 'YNew prototype was unsuccessfully created'
>>>>>>> master
    end
  end

  def show
  end

  def edit
   @main = @prototype.captured_images.where(status: 0).first
   @sub = @prototype.captured_images.where(status: 1)
   @sub_new = @prototype.captured_images.where(status: 1).new
   @main.content.cache! unless @main.content.blank?

  end

  def update
<<<<<<< HEAD
    @prototype.update(update_prototype_params)
=======
    @prototype.update(prototype_params)
>>>>>>> master
    redirect_to :root, notice: 'Prototype was successfully updated'
  end

  def destroy
    prototype = Prototype.find(params[:id])
      if prototype.user_id == current_user.id
        prototype.destroy
        redirect_to root_path, alert: 'prototype was successfully deleted'
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
<<<<<<< HEAD
      captured_images_attributes: [:content, :status]
=======

      { :tag_ids => [] },
      captured_images_attributes: [:id, :content, :status],
      tags_attributes: [:title]
      )

      captured_images_attributes: [:id, :content, :status, :prototype_id]
>>>>>>> master
    )

  end
  def update_prototype_params
  params.require(:prototype).permit(
      :title,
      :catch_copy,
      :concept,
      :user_id,
      captured_images_attributes: [:id, :content, :status, :prototype_id, :content_cache]
    )
end
end
