class SessionsController < ApplicationController
  def create
    user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
    )

    if user
      login!(user)
      render json: user
    else
      render json: "invalid username or password"
    end
  end

  def new
  end

  def destroy
  end
end
