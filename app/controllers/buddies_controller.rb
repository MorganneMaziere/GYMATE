class BuddiesController < ApplicationController
  before_action :set_buddy, only: %i[show edit destroy update]

  def index
    @buddies = User.all
  end

  def show
    @new_buddy = BuddiesList.new
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
    if @buddy.update(buddy_params)
      redirect_to @buddy, notice: 'Buddy was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @buddy.destroy
    redirect_to buddies_url, notice: 'Buddy was successfully destroyed.'
  end

  private

  def set_buddy
    @buddy = User.find(params[:id])
  end

  def buddy_params
    params.require(:buddy).permit(:user_id, :buddy_id)
  end
end
