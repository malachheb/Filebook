class TopicsController < ApplicationController

  before_filter :require_login

  def index
    @topics = Topic.where(:user_id => current_user.following.map {|u| u.id}+[current_user.id])
    respond_to do |format|
      format.html
    end
  end

  def show
  end

  def comment
    @topic = Topic.find(params[:id])
    @topic.comments << Comment.create(:user_id => current_user.id, :content => params[:topic][:content])
    respond_to do |format|
      format.html 
      format.js {render :action => "comment"}
    end
  end

  def like
  end
end
