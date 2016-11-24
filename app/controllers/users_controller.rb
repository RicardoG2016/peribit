class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
  end

  def destroy
  	session.clear
  	redirect_to('/')
  end
end
