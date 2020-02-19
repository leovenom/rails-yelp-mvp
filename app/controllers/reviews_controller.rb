class ReviewsController < ApplicationController

  def new
    @review = Review.new
    @review = Restaurant.find(params[:new_restaurant_review])
  end

  def create
    @review = Restaurant.find(params[:restaurant_id])
    @review = Review.new(params_review)
    @review.restaurant = @restaurant
    if @review.save
      redirect_to restaurant_path(@restaurant)
    else
      render :new
    end
  end

  private

  def params_review
    params.require(:review).permit(:content, :rating)
  end
end
