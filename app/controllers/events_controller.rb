class EventsController < ApplicationController
  before_action :set_event, only: %i[show edit update destroy]

  def index
    # @query = params[:query]
    # @events = Event.all
    # if params[:query].present?
    #   @events = Event.global_search(params[:query])
    # end
  end

  # def index
  #   @events = Event.all
  #   if params[:query].present?
  #     @events = @events.where(title: params[:query])
  #   end
  # end

  def show
    @events = Event.all
    @booking = Booking.new
    @booking_to_destroy = @event.bookings.find_by(user: current_user)
    # @event_to_destroy = @event.find_by(user: current_user)
  end

  def new
    @event = Event.new
    @sports = Sport.all
  end

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    if @event.save
      redirect_to @event, notice: 'Event was successfully created.'
    else
      render :new
    end
  end

  def edit; end

  def update
    if @event.update(event_params)
      redirect_to @event, notice: 'Event was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to events_path, notice: 'Event was successfully destroyed.'
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :description, :location, :event_date, :sport_id, :starting_hour, :ending_hour, :chatroom_id, :user_id)
  end
end
