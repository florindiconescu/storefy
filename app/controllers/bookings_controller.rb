class BookingsController < ApplicationController
  before_action :set_storage, only: [:create]

  def index
    @bookings = policy_scope(Booking)
    @bookings = current_user.bookings
  end

  def show
    authorize @booking
    @booking = Booking.find(params[:id])
  end

  def new
    authorize @booking
    @booking = Booking.new
  end

  def create
    @user = current_user
    @booking = Booking.new(strong_params)
    authorize @booking
    @booking.status = 'pending'
    @booking.storage = @storage
    @booking.user = @user
    @booking.total_price = @booking.storage.price / 30 * (@booking.end_date - @booking.start_date).to_i
    if @booking.save
      redirect_to bookings_path
    else
      render 'storage/show'
    end
  end

  def approved
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.status = 'accepted'
    @booking.save
    redirect_to storage_path(@booking.storage)
  end

  def denied
    @booking = Booking.find(params[:id])
    authorize @booking
    @booking.status = 'denied'
    @booking.save
    redirect_to storage_path(@booking.storage)
  end

  private

  def set_storage
    @storage = Storage.find(params[:storage_id])
  end

  def strong_params
    params.require(:booking).permit(:end_date, :start_date, :storage_id, :user_id, :status)
  end
end
