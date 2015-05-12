class UsersController < ApplicationController
    def new
      @user = User.new
      render :new
    end

    def create
      redirect_to "http://google.com/"
    end
end
