class RepliesController < ApplicationController
  # before_action :set_reply, only: [:show, :edit, :update, :destroy]

  # # GET /replies
  # # GET /replies.json
  # def index
  #   @replies = Reply.all
  # end

  # # GET /replies/1
  # # GET /replies/1.json
  # def show
  # end

  # GET /replies/new
  def new
    @post = Post.find(params[:id])
    @reply = Reply.new
  end

  # # GET /replies/1/edit
  # def edit
  # end

  # POST /replies
  # POST /replies.json
  def create
    @post = Post.find(params[:id])
    @reply = Reply.new(reply_params)
    @reply.user_id = current_user.id
    @reply.post_id = @post.id
    @reply.save
    if current_user != @post.user
      @post.delete_at += 15.minutes
      @post.save
    end
    redirect_to post_url(@post)
  end

  # # PATCH/PUT /replies/1
  # # PATCH/PUT /replies/1.json
  # def update
  #   respond_to do |format|
  #     if @reply.update(reply_params)
  #       format.html { redirect_to @reply, notice: 'Reply was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @reply }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @reply.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end

  # DELETE /replies/1
  # DELETE /replies/1.json
  def destroy
    reply = Reply.find(params[:id])
    reply.destroy
    redirect_to :back
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_reply
    #   @reply = Reply.find(params[:id])
    # end

    # Never trust parameters from the scary internet, only allow the white list through.
    def reply_params
      params.require(:reply).permit(:body)
    end
end
