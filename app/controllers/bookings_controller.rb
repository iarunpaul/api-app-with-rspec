class BookingsController < ApplicationController
  before_action :set_hotel
  before_action :set_hotel_booking, only: [:show, :update, :destroy]

  # GET /hotels/:hotel_id/bookings
  def index
    json_response(@hotel.bookings)
  end

  # GET /hotels/:hotel_id/bookings/:id
  def show
    json_response(@booking)
  end

  # POST /hotels/:hotel_id/bookings
  def create
    booking = @hotel.bookings.create!(booking_params)
    json_response(booking, :created)
  end

  # PUT /hotels/:hotel_id/bookings/:id
  def update
    @booking.update(booking_params)
    head :no_content
  end

  # DELETE /hotels/:hotel_id/bookings/:id
  def destroy
    @booking.destroy
    head :no_content
  end

  private

  def booking_params
    params.permit(:booking_reference, :payment_status, :user_id)
  end

  def set_hotel
    @hotel = Hotel.find(params[:hotel_id])
  end

  def set_hotel_booking
    @booking = @hotel.bookings.find_by!(id: params[:id]) if @hotel
  end
end
