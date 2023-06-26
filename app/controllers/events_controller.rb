class EventsController < ApplicationController
  before_action :set_event, only: %i[destroy update edit]

  def create
    @event = Event.new(event_params)
    @event.user = current_user
    # @user_sport.photo_url = "https://source.unsplash.com/random/?tent"
    # @tent.user = User.last
    if @event.save!
      redirect_to dashboard_path(@user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @event = Event.new
  end

  def edit; end

  def update
    @event.update!(event_params)
    redirect_to event_path
  end

  def destroy
    @event.destroy
    redirect_to bookings_path, status: :see_other
  end

  private

  def set_event
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:title, :description, :location, :sport, :starting_time, :ending_time, :user, :event_day)
  end
end
end
