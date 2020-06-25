class UsersController < ApplicationController
  skip_before_action :check_authentication, only: %i[sign_in_view sign_in new create show]

  def new
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end

  def create
    @user = User.new(user_params)
    begin
      @user.save!
      flash[:notice] = 'User successfully created'
      session[:logged_in_user_name] = @user.Username
      session[:logged_in_user_id] = @user.id
      redirect_to home_path
    rescue StandardError => e
      flash[:error] = e.message
      render 'new'
    end
  end

  def sign_in_view
    render :sign_in_view
  end

  def sign_in
    @user = User.find_by(Username: params[:Username])
    if @user
      session[:logged_in_user_name] = @user.Username
      session[:logged_in_user_id] = @user.id
      flash[:notice] = 'You are now logged in'
      redirect_to home_path
    else
      flash[:error] = 'User not found'
      render 'sign_in_view'
    end
  end

  def sign_out
    session[:logged_in_user_id] = nil
    session[:logged_in_user_name] = nil
    redirect_to sign_in_path
  end

  def home
    @new_review = GameReview.new
    render :home
  end

  private

  def user_params
    params.require(:user).permit(:Username, :FullName, :avatar, :cover_picture)
  end
end
