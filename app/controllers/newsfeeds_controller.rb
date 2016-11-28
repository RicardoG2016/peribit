class NewsfeedsController < ApplicationController

  def index
    @post = Post.all
  end

end
