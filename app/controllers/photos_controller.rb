class PhotosController < ApplicationController
  before_action :set_storage, only: [:index, :create]

  def index
    @photo = Photo.new
    @photos = policy_scope(Photo).where(storage: @storage)
  end

  def create
    @photo = Photo.new(photo_params)
    authorize @photo
    @photo.storage = @storage
    @photo.save
    redirect_to storage_photos_path(@storage)
    # if @photo.save
    #   redirect_to storage_path(@storage)
    # else
    #   render 'new'
    # end
  end

  def destroy
    @photo = Photo.find(params[:id])
    authorize @photo
    @photo.destroy
    @storage = @photo.storage
    redirect_to storage_photos_path(@storage)
  end

  private

  def photo_params
    params.require(:photo).permit(:data)
  end

  def set_storage
    @storage = Storage.find(params[:storage_id])
  end
end
