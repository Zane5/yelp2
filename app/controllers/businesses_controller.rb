class BusinessesController < ApplicationController
  def new
    @business = Business.new
  end

  def create
    @business = Business.new(params[:business].permit(:name, :description, :picture_url, :category_id))

    if @business.save
      flash[:success] = "New Business listed!"
      redirect_to businesses_path
    else
      flash[:danger] = "There were something missing."
      render :new
    end
  end

  def index
    @categories = Category.all
  end

  def show
    @business = Business.find(params[:id])
    @reviews = @business.reviews.all if @business
  end
end
