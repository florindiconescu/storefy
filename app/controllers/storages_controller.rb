class StoragesController < ApplicationController
  before_action :set_storage, only: [:show, :edit, :update, :destroy]

  def my_storages
    @storages = current_user.storages.where(active: true)
  end

  def index
    @storages = policy_scope(Storage)
    @storages = Storage.all.where(active: true)
    @storages = Storage.where.not(active: false, latitude: nil, longitude: nil)

    if params[:location].present? # attention a l'input field name
      @storages = @storages.where("address ILIKE ?", "%#{params[:location]}%")
    end

    # if params[:sqm].present?
    #   @storages = @storages.where(sqm: params[:sqm])
    # end
    # I can add other filters if I want to add some on the results page like "Filter by price"
    @markers = @storages.map do |storage|
      {
        lat: storage.latitude,
        lng: storage.longitude,
        infoWindow: render_to_string(partial: "infowindow", locals: { storage: storage }),
        image_url: helpers.asset_url('red_pin.png')
      }
    end
  end

  def show
    authorize @storage
    if @storage.active == false
      redirect_to root_path
      flash[:alert] = "Sorry this storage doesn't exist anymore"
    end
    @booking = Booking.new
  end

  def new
    @storage = Storage.new
    authorize @storage
  end

  def create
    @storage = Storage.new(storage_params)
    authorize @storage
    @storage.user = current_user
    if @storage.save
      redirect_to my_storages_path
    else
      render 'new'
    end
  end

  def edit
    authorize @storage
  end

  def update
    authorize @storage
    @storage.update(storage_params)
    redirect_to storage_path(@storage)
  end

  def destroy
    authorize @storage
    @storage.active = false
    @storage.save
    redirect_to my_storages_path
  end

  private

  def storage_params
    params.require(:storage).permit(:title, :price, :sqm, :address, :description, :user_id)
  end

  def set_storage
    @storage = Storage.find(params[:id])
    authorize @storage
  end
end
