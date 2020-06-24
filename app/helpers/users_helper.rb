module UsersHelper
  def sign_in_path
    '/sign_in'
  end

  def sign_out_path
    '/sign_out'
  end

  def user_avatar_image_url(user)
    user.avatar.attached? ? url_for(user.avatar) : asset_url('default_profile.jpg')
  end

  def logged_in_user
    session[:logged_in_user_id] ? User.find(session[:logged_in_user_id]) : nil
  end

  def user_cover_picture_url(user)
    user.cover_picture.attached? ? url_for(user.cover_picture) : asset_url('default_cover.jpg')
  end

  def user_options_button(user)
    show_b = logged_in_user && (user.id != logged_in_user.id)
    return '<a class=user-page__user-action-button href=# ><i class=fas fa-list fa-xl></i></a>'.html_safe if show_b
  end

  def followable_user_list
    session[:logged_in_user_id] ? User.find(session[:logged_in_user_id]).followable : User.all
  end
end
