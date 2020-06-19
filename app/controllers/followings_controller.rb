class FollowingsController < ApplicationController

  def unfollow_user
    current_user = User.find(session[:logged_in_user_id])
    target_user = User.find(params[:id])
    unfollowing = Following.where(follower: current_user).where(followed: target_user).first
    begin
      Following.destroy(unfollowing.id)
      flash[:notice] = "No longer following #{target_user.Username}"
    rescue Exception => e
      flash[:error] = "Error: #{e.message}"
    end
    redirect_to request.referer
  end

  def follow_user
    following = Following.create(follower: User.find(session[:logged_in_user_id]), followed: User.find(params[:id]))
    if following.persisted?
      flash[:notice] = "Now following #{following.followed.Username}"
    else
      flash[:error] = "Could not follow user"
    end
    redirect_to request.referer
  end
end
