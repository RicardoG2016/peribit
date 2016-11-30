class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update, :destroy]
  respond_to :html, :js
  # before_action :authenticate_user!
  
  # GET /posts
  # GET /posts.json
  def index
    if !current_user
      redirect_to '/users/sign_up'
    else
      @trending = Post.trending
      @posts = []
      Post.all.each do |post|
        if current_user.follows?(post.user) || post.user == current_user
          @posts << post 
        end
      end
    end 
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = Post.new
    @post.user = current_user
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.user = current_user
    @post.delete_at = 3.hours.from_now

    if @post.body.match("(?:f|ht)tps?:\/[^\s]+") != nil
      link = @post.body.match("(?:f|ht)tps?:\/[^\s]+")
      @post.link = link[0]
      doc = Nokogiri::HTML(open(@post.link))
      @post.image = doc.search('meta[property="og:image"]').pluck('content')[0]
      @post.og_description = doc.search('meta[property="og:description"]').pluck('content')[0]
      @post.og_title = doc.search('meta[property="og:title"]').pluck('content')[0]
      if @post.og_description != nil
        @post.body.gsub!(@post.link, "").strip
      end
    end

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      elsif @post.body == "" && @post.link != nil 
        @post.save(validate: false)
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def like_post
    @post = Post.find(params[:id])
    if request.xhr?
      if !current_user.likes?(@post)
        @post.delete_at += 15.minutes
        current_user.like!(@post)
        @like = @post.likers(User).count.to_s
        @post.save
        render json: @like
      end
    else
      if !current_user.likes?(@post)
        current_user.like!(@post)
        @post.delete_at += 15.minutes
        @post.save
        redirect_to :back
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:body, :delete_at, :user_id, :image)
    end
end
