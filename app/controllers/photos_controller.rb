class PhotosController < ApplicationController
  def index
    @storage = Storage.find(params[:storage_id])
    @photo = Photo.new
    @photos = @storage.photos
  end

  def create

    @photos.save
  end

  def destroy
    @photo.destroy
    redirect_to
  end
end
