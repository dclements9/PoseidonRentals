class SessionsController < ApplicationController
  
  def new
  end

  def create
    @user = User.find_by(email: params[:email])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash[:alert] = "Invalid Credentials. Please Try Again."
      redirect_to login_path
    end
  end

  def github_create
    @user = User.find_or_create_by(email: oauth[:email]) do |u|
      u.name = oauth[:info][:name]
      u.email = oauth[:info][:email]
      u.password = SecureRandom.hex
      u.image = oauth[:info][:image]
    end

    session[:user_id] = @user.id

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
