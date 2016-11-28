class UsersController < ApplicationController
  
def search
  if params[:search].present?
    @users = User.search(params[:search])
  else
    alert:"User not found"
  end 
end

  def show
  	redirect_to('/users/sign_in') and return if !current_user
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
