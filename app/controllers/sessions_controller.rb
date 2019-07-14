class SessionsController < ApplicationController
  
  def new
  end

  def create
    if auth_hash = request.env["omniauth.auth"]
      #logged in with OAUTH
      raise auth_hash.inspect
    else
      @user = User.find_by(email: params[:email])

      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to @user
      else
        flash[:alert] = "Invalid Credentials. Please Try Again."
        redirect_to login_path
      end
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_path
  end
end
