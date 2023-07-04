class ReviewsController < ApplicationController
  before_action :set_buddies_list, only: %i[new create]
  before_action :set_review, only: %i[show edit update destroy]

  # GET /reviews
  def index
    @reviews = Review.all
  end

  # GET /reviews/:id
  def show; end

  def new
    @review = Review.new
  end

  # POST /reviews
  def create
    @review = Review.new(review_params)
    @review.buddies_list = @buddies_list
    @review.user = current_user
    if @review.save
      redirect_to buddies_list_path(@buddies_list)
    end
  end

  def edit; end
  # PATCH/PUT /reviews/:id
  def update
    if @review.update(review_params)
      redirect_to buddy_path(@buddy)
    else
      render @review.errors, status: :unprocessable_entity
    end
  end

  # DELETE /reviews/:id
  def destroy
    @review.destroy
    redirect_to buddies_list_path(@review.buddies_list)
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def set_buddies_list
    @buddies_list = BuddiesList.find(params[:buddies_list_id])
  end

  def review_params
    params.require(:review).permit(:rating, :comment, :user, :buddies_list)
  end
end
