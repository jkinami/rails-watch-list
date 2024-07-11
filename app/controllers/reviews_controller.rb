class ReviewsController < ApplicationController
  before_action :set_list, only: %i[new create]

  def new
    @review = Review.new
    @movies = Movie.all
  end

  def create
    @review = Review.new(review_params)
    @review.list = @list
    if @review.save
      redirect_to list_path(@review.list)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private
  def set_list
    @list = List.find(params[:list_id])
  end

  def review_params
    params.require(:review).permit(:comment)
  end
end
