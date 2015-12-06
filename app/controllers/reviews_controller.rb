class ReviewsController < ApplicationController
  before_filter :require_user

  def index
    @reviews = Review.first(25)
  end

  def create
    @business = Business.find(params[:business_id])
    review = @business.reviews.build(review_params.merge!(user: current_user))
    if review.save
      redirect_to @business
    else
      @reviews = @business.reviews.reload
      redirect_to @business
    end
  end

  private

  def review_params
    params.require(:review).permit(:description)
  end
end 
