class ReviewsController < ApplicationController

  def create
    @review = Review.new(review_params)
    @buddy = Buddy.find(params[:buddy_id])
    @review.buddy = @buddy
    # @review.buddy = current_user
    @review.save
    redirect_to buddy_path(@buddy)
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to buddy_path(@review.buddy)
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end
end
