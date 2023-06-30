class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @user = current_user
    @events = Event.all
    @query = params[:query]
    @events = Event.all
    if params[:query].present?
      @events = Event.global_search(params[:query])
    end
  end

  def dashboard
  end
end
