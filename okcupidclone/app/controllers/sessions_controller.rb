class SessionsController < ApplicationController
  def create
    user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password]
    )

    if user
      login!(user)
      #redirect somewhere
    else
      #show errors, render this page again
    end
  end

  def new
  end

  def destroy
  end
end
