class PhotosController < ApplicationController
  before_action :set_storage, only: [:index, :create]

  def index
    @photo = Photo.new
    @photos = @storage.photos
  end

  def create
    @photo = Photo.new(photo_params)
    @photo.storage = @storage
    @photo.save
    raise
    # if @photo.save
    #   redirect_to storage_path(@storage)
    # else
    #   render 'new'
    # end
  end

  def destroy
    @photo.destroy
    redirect_to
  end

  private

  def photo_params
    params.require(:photo).permit(:data, :storage_id)
  end

  def set_storage
    @storage = Storage.find(params[:storage_id])
  end
end
