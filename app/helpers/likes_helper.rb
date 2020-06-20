module LikesHelper
  def like_path(game_review)
    "/like/#{game_review.id}"
  end
end
