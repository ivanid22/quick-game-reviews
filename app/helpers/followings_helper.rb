module FollowingsHelper
  def follow_user_path(user)
    "/follow/#{user.id}"
  end

  def unfollow_user_path(user)
    "/unfollow/#{user.id}"
  end

  def follow_user_button(user)
    cf = logged_in_user && (logged_in_user.id != user.id) && (!logged_in_user.followed.include? user)
    cu = logged_in_user && (logged_in_user.followed.include? user)
    return "<a class=follow-b href=#{follow_user_path(user)}><i class=fas fa-user-plus fa-xl></i></a>".html_safe if cf

    return "<a class=follow-b href=#{unfollow_user_path(user)}><i class=fas fa-times fa-xl></i></a>".html_safe if cu

    nil
  end
end
