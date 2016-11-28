class FollowingController < ApplicationController

  def index 
    @following = current_user.followees(User)
  end

end
