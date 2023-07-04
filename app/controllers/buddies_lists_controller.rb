class BuddiesListsController < ApplicationController
  before_action :set_buddies_list, only: %i[show edit destroy update]

  def index
    @buddies_lists = current_user.buddies_lists

    @buddies_by_sport = []

    @buddies_lists.each do |buddy_list|
      current_user.sports.each do |sport|
        if buddy_list.buddy.sports.include?(sport) && !@buddies_by_sport.include?(buddy_list)
          @buddies_by_sport << buddy_list
        end
      end
    end

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
    @review = Review.new
    @events = current_user.events
    @reviews = []

    @buddies_list.reviews.each do |review|
      @reviews << Review.find_by(id: review)
    end
  end

  def new
    @buddies_list = BuddiesList.new
  end

  def create
    @buddies_list = BuddiesList.new(buddy_params)
    @buddies_list.user = current_user

    if @buddies_list.save
      redirect_to @buddies_list, notice: 'Buddy was successfully created.'
    else
      render :new
    end
  end

  def edit; end

  def update
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
    @buddies_list.destroy
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
