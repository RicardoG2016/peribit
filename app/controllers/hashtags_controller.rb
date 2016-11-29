class HashtagsController < ApplicationController

  def search
    
    if params[:search].present?
      @hashtags = SimpleHashtag::Hashtag.search(params[:search])
    else
      alert:"Search not found"
    end 
  end

  def index
    @hashtags = SimpleHashtag::Hashtag.all
  end

  def show
    @hashtag = SimpleHashtag::Hashtag.find_by_name(params[:hashtag])
    @hashtagged = @hashtag.hashtaggables if @hashtag
  end

end
