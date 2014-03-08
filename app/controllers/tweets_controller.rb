class TweetsController < ApplicationController
  before_action :set_tweet, only: [:show, :edit, :update, :destroy]
  #before_filter :authenticate_user!

  include TweetsHelper

  # GET /tweets
  # GET /tweets.json
  def index
    @tweets = Tweet.all
  end

  # GET /tweets/1
  # GET /tweets/1.json
  def show
    # get all comments for this tweet
    @comments = @tweet.comments

    # get the number of comments each tweet has
    @num_comments = @comments.count

  end

  # this method is defined to retroactively update all the num_comments !!
  # this is a throw-away method which is discarded once it's function is complete!!
  def update_all_tweets

    tweets = Tweet.all

    @response_html = ""

    tweets.each do |tweet|
      set_num_comments (tweet.id)

      @response_html += "Update tweet <b>#{tweet.id}<b><br><br> \n "

    end

  end

  # GET /tweets/new
  def new
    @tweet = Tweet.new
  end

  # GET /tweets/1/edit
  def edit
  end

  # POST / tweets
  # POST / tweets.json
  # POST / tweets.js
  def create
    @tweet = Tweet.new(tweet_params)

    # This is necessary to link each tweets user_id to the current_user.id
    @tweet.user_id = current_user.id

    respond_to do |format|
      if @tweet.save
        format.html { redirect_to @tweet, notice: 'Tweet was successfully created.' }
        format.json { render action: 'show', status: :created, location: @tweet }
        format.js
      else
        format.html { render action: 'new' }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tweets/1
  # PATCH/PUT /tweets/1.json
  def update
    respond_to do |format|
      if @tweet.update(tweet_params)
        format.html { redirect_to @tweet, notice: 'Tweet was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tweets/1
  # DELETE /tweets/1.json
  def destroy
    @tweet.destroy
    respond_to do |format|
      format.html { redirect_to tweets_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tweet_params
      params.require(:tweet).permit(:tweets, :user_id, :comment_id, :num_comments)
    end
end
