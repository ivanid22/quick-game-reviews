class LikesController < ApplicationController
  def like
    user = User.find(session[:logged_in_user_id])
    review = GameReview.find(params[:id])
    like = Like.new(user: user, game_review: review)
    begin
      like.save
    rescue Exception => e
      flash[:error] = "Error: #{e.message}"
    end
    redirect_to request.referer
  end
end
