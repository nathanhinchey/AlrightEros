class MainController < ApplicationController
  # before_filter :require_signed_in

  def index
    render :index
  end

end
