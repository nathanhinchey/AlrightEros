class Api::ProfilesController < ApplicationController
  def index
    unless current_user && current_user.profile
      redirect_to new_user_url
    else
      @profiles = Profile.all
      render :index
    end
  end

  def new
    @profile = Profile.new
    render :new
    #find current user by session token?
  end

  def create
    user_id = Session
      .find_by(session_token: session[:session_token])
      .user_id

    @profile = Profile.new(profile_params)
    @profile.user_id = user_id
    if @profile.save
      redirect_to root_url
    else
      flash.now[:errors] = @profile.errors.full_messages
      render :new
    end
  end

  def edit
  end

  def show
    @profile = Profile.find(params[:id])
    render :show
  end

  private
    def profile_params
      params
        .require(:profile)
        .permit(:username, :birthday, :summary)
    end
end
