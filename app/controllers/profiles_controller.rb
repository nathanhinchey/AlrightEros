class ProfilesController < ApplicationController
  def new
    @profile = Profile.new
    render :new
    #find current user by session token?
  end

  def create
    user_id = Session
      .find_by(:session_token, session[:session_token])
      .user_id

    @profile = Profile.new(profile_params)
    @profile.user_id = user_id

    if @user.save
      redirect_to root_url
    else
      flash.now(@user.errors.full_messages)
      render :new
    end
  end

  def edit
  end

  private
    def profile_params
      params
        .require(:profile)
        .permit(:username, :birthday, :self_summary)
    end
end
