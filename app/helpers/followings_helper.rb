module FollowingsHelper
  def follow_user_path(user)
    "/follow/#{user.id}"
  end

  def unfollow_user_path(user)
    "/unfollow/#{user.id}"
  end
end
