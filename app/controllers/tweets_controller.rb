class TweetsController < ApplicationController
  before_action :set_tweet, only:[:edit, :show]
  
  def index
    @tweets = Tweet.all
  end

  def new
    @tweet = Tweet.new
  end
  
  def create
    @tweet = Tweet.create(params_tweet)
    # if @tweet.save
    #   redirect_to: root_path
    # end
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
  end

  def edit
  end

  def update
    tweet = Tweet.find(params[:id])
    tweet.update(params_tweet)
  end

  def show
  end

  private

  def params_tweet
    params.require(:tweet).permit(:name, :image, :text)
  end

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end
end
