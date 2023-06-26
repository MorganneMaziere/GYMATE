class BuddiesController < ApplicationController
  before_action :set_buddy, only: %i[show destroy update]

  def index
    @buddies = User.all
  end

  def show
    @new_buddy = BuddiesList.new
  end

  def create

  end

  def edit

  end


  private

  def set_buddy
    @buddy = User.find(params[:id])
  end
end
