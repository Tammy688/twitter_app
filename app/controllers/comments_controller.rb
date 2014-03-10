class CommentsController < ApplicationController
  before_action :set_comment, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!

  include TweetsHelper #include the helper method from the resource tweets (can be used in other controllers)

  # GET /comments
  # GET /comments.json
  def index
    @comments = Comment.all
  end

  # GET /comments/1
  # GET /comments/1.json
  def show

  end

  # GET /comments/new
  def new
    @comment = Comment.new

    # the tweet_id is passed from the tweets show view in the symbol
    @tweet_id = params[:tweet_id]

    # the tweet with the new tweet_id is found from the tweets
    @tweet = Tweet.find(@tweet_id)

    # setting up relationship between a child and a parent (belongs_to)
    @user = @comment.user

  end

  # GET /comments/1/edit
  def edit
  end

  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(comment_params)

    @comment.user_id = current_user.id

    puts "***************************************************"
    puts "DEBUG CODE"
    puts ":tweet_id --> #{comment_params[:tweet_id]}"
    puts "***************************************************"

    respond_to do |format|
      if @comment.save
        format.html { redirect_to @comment, notice: 'Comment was successfully created.' }
        format.json { render action: 'show', status: :created, location: @comment }
      else
        format.html { render action: 'new' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  
    # Update the number of comments for each tweet
    # --------------------------------------------
    # Important to add this after a save to ensure that you don't lag
    # behind in counting!!
    # Note that the logic for this method is in the Tweets helper
    # NOTE: Rails gives you params which contains stuff that the page passes around
    # Remember that commen_params is passed from the FORM!!!!!!
    set_num_comments(comment_params[:tweet_id])

  end

  # PATCH/PUT /comments/1
  # PATCH/PUT /comments/1.json
  def update
    respond_to do |format|
      if @comment.update(comment_params)
        format.html { redirect_to @comment, notice: 'Comment was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.json
  def destroy
    @comment.destroy
    respond_to do |format|
      format.html { redirect_to comments_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_comment
      @comment = Comment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params.require(:comment).permit(:comments, :user_id, :tweet_id)
    end
end
