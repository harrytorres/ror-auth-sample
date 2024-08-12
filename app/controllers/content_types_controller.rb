class ContentTypesController < ApplicationController
   before_action :set_content_type, only: [:show, :edit, :update, :destroy]

  def index
    @content_type = ContentType.arrange(order: :name)
  end

  def show
  end

  def new
    @content_type = ContentType.new
    @parent_content_types = ContentType.all
  end

  def create
    @content_type = ContentType.new(content_type_params)
    if @content_type.save
      redirect_to @content_type, notice: 'Content type was successfully created.'
    else
      render :new
    end
  end

  def edit
    @content_type = ContentType.find(params[:id])
    @parent_content_types = ContentType.where.not(id: @content_type.subtree_ids)
  end

  def update
    if @content_type.update(content_type_params)
      redirect_to @content_type, notice: 'Content type was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @content_type.destroy
    redirect_to content_type_url, notice: 'Content type was successfully destroyed.'
  end

  def publish
    @content_type = ContentType.find(params[:id])
    if @content_type.publish
      redirect_to @content_type, notice: 'Content type was successfully published.'
    else
      redirect_to @content_type, alert: 'Failed to publish content type.'
    end
  end

  def unpublish
     @content_type = ContentType.find(params[:id])
     if @content_type.unpublish
      redirect_to @content_type, notice: 'Content type was successfully unpublished.'
    else
      redirect_to @content_type, alert: 'Failed to unpublish content type.'
    end
  end

  private

  def set_content_type
    @content_type = ContentType.find(params[:id])
  end

  def content_type_params
    params.require(:content_type).permit(:name, :description, :parent_id, :state, :public_uid)
  end
end
