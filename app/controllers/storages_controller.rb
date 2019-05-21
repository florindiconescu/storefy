class StoragesController < ApplicationController
  before_action :set_storage, only: [:show, :edit, :update, :destroy]

  def my_storages
    @storages = current_user.storages
  end

  def index
    if params[:query]
      @storages = Storage.where(location: params[:query])

    else
      @storages = Storage.all
    end
  end

  def show
  end

  def new
    @storage = Storage.new
  end

  def create
    @storage = Storage.new(storage_params)
    @storage.user = current_user
    if @storage.save
      redirect_to storage_path(@storage)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def storage_params
    params.require(:storage).permit(:title, :price, :sqm, :address, :description, :user_id)
  end

  def set_storage
  end
end
