module FollowersHelper

def followers
  @followers = []
  @followers = User.find(current_user.followers(User.all))
end

end
