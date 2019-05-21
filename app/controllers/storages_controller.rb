class StoragesController < ApplicationController
  before_action :set_storage, only: [:show, :edit, :update, :destroy]

  def my_storages
    @storages = current_user.storages
  end

  def index
    @storages = Storage.all

    if params[:location] # attention a l'input field name
      @storages = @storages.where(address: params[:location])
    end

    if params[:sqm]
      @storages = @storages.where(sqm: params[:sqm])
    end
    # I can add other filters if I want to add some on the results page like "Filter by price"
  end

  def show
    if @storage.user == current_user
      @bookings = @storage.bookings
    else
      @booking = Booking.new
    end
  end

  def new
    @storage = Storage.new
  end

  def create
    @storage = Storage.new(storage_params)
    @storage.user = current_user
    if @storage.save
      redirect_to my_storages_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    @storage.update(storage_params)
    redirect_to my_storages_path
  end

  def destroy
    @storage.destroy
    redirect_to my_storages_path
  end

  private

  def storage_params
    params.require(:storage).permit(:title, :price, :sqm, :address, :description, :user_id)
  end

  def set_storage
    @storage = Storage.find(params[:id])
  end
end
