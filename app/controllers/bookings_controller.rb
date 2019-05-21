class BookingsController < ApplicationController
  before_action :set_storage, only: [:create]

  def index
    @bookings = current_user.bookings
  end

  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
  end

  def create
    @user = current_user
    @booking = Booking.new(strong_params)
    @booking.storage = @storage
    @booking.user = @user
    @booking.total_price = @booking.storage.price / 30 * (@booking.end_date - @booking.start_date).to_i
    if @booking.save
      redirect_to storage_path(@storage)
    else
      render 'storage/show'
    end
  end

  private

  def set_storage
    @storage = Storage.find(params[:storage_id])
  end

  def strong_params
    params.require(:booking).permit(:end_date, :start_date, :storage_id, :user_id)
  end
end
