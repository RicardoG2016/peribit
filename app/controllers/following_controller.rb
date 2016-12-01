class FollowingController < ApplicationController

  def index 
  	@user = User.find(params[:id])
    @following = @user.followees(User)
  end

end
