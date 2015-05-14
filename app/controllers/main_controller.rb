class MainController < ApplicationController
  before_filter :require_signed_in

  def index
    render :index
  end

  private
    def require_signed_in
      redirect_to new_user_url unless current_user
    end
end
