class Api::ProfilesController < ApplicationController
  wrap_parameters false

  def index
    unless current_user && current_user.profile
      render json: {}
    else
      @profiles = Profile
        .all
        .includes(:user)
        .page(params[:page])
        .per(4)
      render :index
    end
  end

  def new
    @motivations = []
    Motivation.all.each do |motivation|
      @motivations << motivation.body
    end
    render :new
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
      render :show
    else
      render json: @profile.errors.full_messages, status: 422
    end
  end

  def update
    unless current_user.profile.id == params[:id].to_i
      head :forbidden
      return
    end

    @profile = Profile.find(params[:id])
    if @profile.update(profile_params)
      render :show
    else
      render json: @profile.errors.full_messages, status: 422
    end
  end

  private
    def profile_params
      params
        .require(:profile)
        .permit(:username, :birthday, :summary, :picture)
    end
end
