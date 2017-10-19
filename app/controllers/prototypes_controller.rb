class PrototypesController < ApplicationController
  before_action :set_prototype, only: [:show, :edit, :update]

  def index
    @prototypes = Prototype.all.page(params[:page]).per(5)
  end

  def new
    @prototype = Prototype.new
    @prototype.captured_images.build
    # @sub = @prototype.captured_images.where(status: 1).first

  end

  def create
    @prototype = Prototype.new(prototype_params)
    # if @sub.present?
    #   File.open(Rails.root.join("assets/images/default.jpg")) do |f|
    #   @prototype.content = f
    #   end
    if @prototype.save
      redirect_to :root, notice: 'New prototype was successfully created'
    else
      redirect_to ({ action: new }), alert: 'YNew prototype was unsuccessfully created'
     end
  end

  def show
    # @prototype = Prototype.find(params[:id])
  end

  def edit
   @main = @prototype.captured_images.where(status: 0).first
   @sub = @prototype.captured_images.where(status: 1)
   @sub_new = Prototype.new
  end

  def update
    # if prototype.user_id == current_user.id
    # binding.pry
    @prototype.update(prototype_params)
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
      captured_images_attributes: [:id, :content, :status, :prototype_id]
    )
  end
end
