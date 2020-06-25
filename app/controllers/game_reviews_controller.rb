class GameReviewsController < ApplicationController
  def create
    @game_review = GameReview.new(game_review_params)
    if @game_review.save
      flash[:notice] = 'Game Review successfully created'
    else
      flash[:error] = 'Error creating review. Please fill in both fields'
    end
    redirect_to request.referer
  end

  private

  def game_review_params
    params.require(:game_review).permit(:title, :Text, :AuthorId)
  end
end
