class SessionsController < ApplicationController
  
  def home
    if !session[:user_id].nil?
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
      current_user
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
      u.image = oauth[:info][:image]
    end
    set_current_user

    redirect_to @user
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
