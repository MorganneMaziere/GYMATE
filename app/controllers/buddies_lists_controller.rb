class BuddiesListsController < ApplicationController
  before_action :set_buddies_list, only: %i[show edit destroy update]


  def index
    @buddies_lists = current_user.buddies_lists

    @favorite_buddies = []
    @buddies_lists.where(confirmed: true).each do |buddies_list|
      @favorite_buddies << buddies_list
      @query = params[:query]
    end

    if params[:query].present?
      @buddies_lists = []
      current_user.buddies_lists.each do |buddies_list|
        @buddies_lists << buddies_list if buddies_list.buddy.first_name == "Charlotte"
      end
    end
  end

  def show
    @events = []

    current_user.bookings.each do |booking|
      @events << booking.event
    end
  end

  def new
    @buddies_list = BuddiesList.new
  end

  def create
    @buddies_list = BuddiesList.new(buddy_params)
    if @buddies_list.save
      redirect_to @buddies_list, notice: 'Buddy was successfully created.'
    else
      render :new
    end
  end

  def edit; end

  def update
    @buddies_list = BuddiesList.find(params[:id])
    if params[:status] == "like"
      @buddies_list.confirmed = true
    else
      @buddies_list.confirmed = false
    end
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

  def set_buddies_list
    @buddies_list = BuddiesList.find(params[:id])
  end

  def buddy_params
    params.require(:buddy).permit(:name, :photo_url, :user_id, :buddy_id)
  end
end
