class ReviewsController < ApplicationController
  before_action :set_review, only: %i[show edit update destroy]

  # GET /reviews
  def index
    @reviews = Review.all
  end

  # GET /reviews/:id
  def show; end

  # POST /reviews
  def create
    @review = Review.new(review_params)
    @buddy = Buddy.find(params[:buddy_id])
    @review.buddy = @buddy
    # @review.buddy = current_user
    if @review.save
      redirect_to buddy_path(@buddy), status: :created
    else
      render @review.errors, status: :unprocessable_entity
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
    redirect_to buddy_path(@review.buddy)
  end

  private

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:rating, :comment, :booking_id)
  end
end
