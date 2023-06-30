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

    @buddies_lists = current_user.buddies_lists
    @favorite_buddies = []
    @buddies_lists.where(confirmed: true).each do |buddies_list|
      @favorite_buddies << buddies_list.buddy
    end
  end

  def dashboard
  end
end
