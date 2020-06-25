module LikesHelper
  def like_path(game_review)
    "/like/#{game_review.id}"
  end

  def like_button(review)
    nl = review.likes.all.includes(:user).where(user: logged_in_user).empty?
    return "<a href=#{like_path(review)} class=like-button><i class=\"fas fa-thumbs-up\"></i></a>".html_safe if nl
  end
end
