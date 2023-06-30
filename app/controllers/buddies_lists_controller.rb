class BuddiesListsController < ApplicationController
  before_action :set_buddy, only: %i[show edit destroy update]

  def index
    @buddies_lists = current_user.buddies_lists

    # @buddies_by_sport = []

    # @buddies_lists.each do |buddy_list|
    #   current_user.sports.each do |sport|
    #     if buddy_list.buddy.sports.include?(sport) && !@buddies_by_sport.include?(buddy)
    #       @buddies_by_sport << buddy_list.buddy
    #     end
    #   end
    # end

    @favorite_buddies = []
    @buddies_lists.where(confirmed: true).each do |buddies_list|
      @favorite_buddies << buddies_list.buddy
    end
  end

  def show
    @events = []
    current_user.bookings.each do |booking|
      @events << booking.event
    end
  end

  def new
    @buddy = Buddy.new
  end

  def create
    @buddy = Buddy.new(buddy_params)
    if @buddy.save
      redirect_to @buddy, notice: 'Buddy was successfully created.'
    else
      render :new
    end
  end

  def edit; end

  def update
    @buddies_list = BuddiesList.find(params[:id])
    @buddies_list.confirmed = true
    @buddies_list.save
    # if @buddy.update(buddy_params)
    #   redirect_to @buddy, notice: 'Buddy was successfully updated.'
    # else
    #   render :edit
    # end
  end

  def destroy
    @buddy.destroy
    redirect_to buddies_url, notice: 'Buddy was successfully destroyed.'
  end

  private

  def set_buddy
    @buddies_list = BuddiesList.find(params[:id])
  end

  def buddy_params
    params.require(:buddy).permit(:name, :photo_url, :user_id, :buddy_id)
  end
end
