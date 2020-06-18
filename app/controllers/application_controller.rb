class ApplicationController < ActionController::Base
  before_action :check_authentication

  def check_authentication
    unless session[:logged_in_user_id]
      flash[:error] = "You must be logged in to perform that action"
      redirect_to sign_in_path
    end
  end
end
