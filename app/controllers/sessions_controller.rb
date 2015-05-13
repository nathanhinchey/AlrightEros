class SessionsController < ApplicationController
  def create
    user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
    )

    if user
      login!(user)
      redirect_to root_url
    else
      flash.now[:errors] = ["Invalid username or password"]
      render :new
    end
  end

  def new
  end

  def destroy
    @session = Session.find_by(session_token: session[:session_token])
    @session.destroy()
    redirect_to new_session_url
  end
end
