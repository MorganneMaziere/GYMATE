class UsersSportsController < ApplicationController
  before_action :set_user_sport, only: %i[destroy update edit]

  def create
    @user_sport = User_sport.new(user_sport_params)
    @user_sport.user = current_user
    # @user_sport.photo_url = "https://source.unsplash.com/random/?tent"
    # @tent.user = User.last
    if @user_sport.save!
      redirect_to dashboard_path(@user)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def new
    @user_sport = User_sport.new
  end

  def edit; end

  def update
    @user_sport.update!(user_sport_params)
    redirect_to user_sport_path
  end

  def destroy
    @user_sport.destroy
    redirect_to bookings_path, status: :see_other
  end

  private

  def set_user_sport
    @user_sport = user_Sport.find(params[:id])
  end

  def user_sport_params
    params.require(:user_sport).permit(:user, :sport)
  end
end
