class UsersController < ApplicationController

def search
  if params[:search].present?
    if params[:search][0].to_s == "#"
      @users = nil
      params[:search].delete! "#"
      @hashtag = SimpleHashtag::Hashtag.find_by_name(params[:search])
      @hashtagged = @hashtag.hashtaggables if @hashtag
    else
      @users = User.search(params[:search])
    end
  end 
end

  def show
  	redirect_to('/users/sign_in') and return if !current_user
    @user = User.find(params[:id])
    @post = Post.new
    @post.user = current_user
  end

  def destroy
  	session.clear
  	redirect_to('/')
  end

  def delete
    user = User.find(params[:id])
    user.destroy
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
