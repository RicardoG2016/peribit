class UsersController < ApplicationController
  def show
  	# binding.pry
  	redirect_to('/') and return if !current_user
    @user = User.find(params[:id])
  end

  def destroy
  	session.clear
  	redirect_to('/')
  end

  def follow
  	user = User.find(params[:id])
  	current_user.follow!(user)
  	redirect_to(:back)
  end

  def unfollow
  	user = User.find(params[:id])
  	current_user.unfollow!(user)
  	redirect_to(:back)
  end
end
