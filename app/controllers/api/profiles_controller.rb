class Api::ProfilesController < ApplicationController

  def index
    unless current_user && current_user.profile
      head :forbidden
    else
      @profiles = Profile.all
      render :index
    end
  end

  def show
    unless current_user && current_user.profile
      head :forbidden
    else
      @profile = Profile.find(params[:id])
      render :show
    end
  end

  def create
    user_id = Session
      .find_by(session_token: session[:session_token])
      .user_id

    @profile = Profile.new(profile_params)
    @profile.user_id = user_id
    if @profile.save
      render json: @profile #TODO make a template
    else
      render json: @profile.errors.full_messages, status: 422
    end
  end

  private
    def profile_params
      params
        .require(:profile)
        .permit(:username, :birthday, :summary)
    end
end
