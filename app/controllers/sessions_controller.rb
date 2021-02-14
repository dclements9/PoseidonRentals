class SessionsController < ApplicationController
  
  def home
    if logged_in?
      find_user

      redirect_to user_path(@user)
    end
  end

  def new
    @user = User.new
  end

  def create
    @user = User.find_by(email: params[:email])
    
    if @user && @user.authenticate(params[:password])
      set_current_user
      redirect_to @user
    else
      flash[:alert] = "Invalid Credentials. Please Try Again."
      render :new
    end
  end

  def oauth_create
    
    @user = User.find_or_create_by(email: oauth[:info][:email]) do |u|
      u.name = oauth[:info][:name]
      u.email = oauth[:info][:email]
      u.password = SecureRandom.hex
    end

    set_current_user
    redirect_to @user
    
  end

  def google_oauth_create
    
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end

  private

  def oauth
    request.env['omniauth.auth']
  end
end
