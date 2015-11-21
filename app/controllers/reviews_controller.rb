class ReviewsController < ApplicationController
  before_filter :require_user

  def index
    @reviews = current_user.recent_reviews
  end

  def create
  end
end 
