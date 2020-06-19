module UsersHelper
    def sign_in_path
      '/sign-in'
    end

    def user_avatar_image_url(user)
      user.avatar.attached? ? url_for(user.avatar) : '/assets/images/default-profile.png'
    end
end
