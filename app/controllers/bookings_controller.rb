class BookingsController < ApplicationController
  before_action :set_booking, only: %i[show edit update destroy]

  # # registration part
  # def registration
  #   @event = Event.find(params[:id])
  #   @user = current_user

  #   if @event.registration_open?
  #     if @user.registered_for?(@event)
  #       flash[:notice] = 'You are already registered for this event.'
  #     else
  #       @registration = Registration.new(user: @user, event: @event)
  #       if @registration.save
  #         flash[:notice] = 'You have successfully registered for the event.'
  #       else
  #         flash[:alert] = 'Registration failed. Please try again.'
  #       end
  #     end
  #   else
  #     flash[:alert] = 'Registration is closed for this event.'
  #   end

  #   redirect_to event_path(@event)
  # end

  def index
    @bookings = Booking.all
  end

  def show; end

  # inscription à l'event
  def new
    @booking = Booking.new
  end

  def create
    @booking = Booking.new
    @booking.user = current_user
    @booking.event = Event.find(params[:event_id])
    if @booking.save
      redirect_to root_path, notice: 'Booking was successfully created.'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @booking.update(booking_params)
      redirect_to events_path(@booking), notice: 'Booking was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @booking.destroy
    redirect_to root_path, notice: 'Booking was successfully destroyed.'
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:event_id)
  end
end
