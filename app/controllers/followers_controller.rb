class FollowersController < ApplicationController

  def index 
    @followers = current_user.followers(User)
  end

end
