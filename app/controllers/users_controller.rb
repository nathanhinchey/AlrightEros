class UsersController < ApplicationController
  before_filter :require_not_signed_in, only: :new

  def new
    @user = User.new
    @postUrl = users_url
    render :new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      login!(@user)
      redirect_to new_profile_url
    else
      flash.now[:errors] = @user.errors.full_messages
      render :new
    end
  end

  private
    def user_params
      params.require(:user).permit(:email, :password)
    end
end
