class TweetsController < ApplicationController
  before_action :authenticate_user! 
  before_action :set_q, only: [:index, :search]
  def index
    
    @tweets =  Tweet.all #投稿一覧表示用（もともとある前提）
    @q = Tweet.ransack(params[:q])
    @tweets = @q.result(distinct: true) # 重複を避けるために distinct を追加

  # タイプ ID フィルタリング
    if params[:q].present? && params[:q][:type_id_in].present?
      @tweets = @tweets.where(type_id: params[:q][:type_id_in])
    end
    if params[:type]
      Type.create(name: params[:type])
    end
  end

  def search
    @results = @q.result
  end
  def set_q
    @q = Tweet.ransack(params[:q])
  end    
  def new
    @tweet = Tweet.new
  end
  def create
    if params[:new_type_name].present?
      type = Type.find_or_create_by(name: params[:new_type_name])
      params[:tweet][:type_id] = type.id
    end
    
    tweet = Tweet.new(tweet_params)
    tweet.user_id = current_user.id 
    if tweet.save
      redirect_to :action => "index"
    else
      redirect_to :action => "new"
    end
  end
  def show
    @tweet = Tweet.find(params[:id])
    @comments = @tweet.comments
    @comment = Comment.new
  end
  def edit
    @tweet = Tweet.find(params[:id])
  end
  def update
    tweet = Tweet.find(params[:id])
    if tweet.update(tweet_params)
      redirect_to :action => "show", :id => tweet.id
    else
      redirect_to :action => "new"
    end
  end
  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
    redirect_to action: :index
  end

  private
  def tweet_params
    params.require(:tweet).permit(:body,:name,:cost,:type,:evaluation, :taste, :evaluationcost,:access,:lat,:lng,:type_id, images: [])
  end
end
