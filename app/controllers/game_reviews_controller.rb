class GameReviewsController < ApplicationController
    def create
        @game_review = GameReview.new(game_review_params)
        begin
          @game_review.save
          flash[:notice] = "GameReview successfully created"
        rescue Exception => e
          flash[:error] = "Error creating review: #{e.message}"
        end
        redirect_to request.referer
    end

    private

    def game_review_params
      params.require(:game_review).permit(:title, :Text, :AuthorId)
    end
    
end
