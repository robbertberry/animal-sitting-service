class BookingsController < ApplicationController
  before_action :authenticate_user!

  def index
    @bookings = current_user.admin? ? Booking.all : current_user.bookings
  end

  def new
    @booking = Booking.new
  end

  def create
    @booking = current_user.bookings.new(booking_params)

    if @booking.save
      redirect_to bookings_path, flash: { success: 'Booking added successfully!' }
    else
      flash[:error] = 'Some error occured!'

      render :new
    end
  end

  private

    def booking_params
      params.require(:booking)
            .permit(:first_name, :last_name, :animal_name, :date_of_service, :animal_type, :hours_requested)
    end
end
