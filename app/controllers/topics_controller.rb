class TopicsController < ApplicationController

  before_filter :require_login

  def index
    @topics = current_user.topics
    respond_to do |format|
      format.html
    end
  end

  def show
  end

  def comment
  end

  def like
  end
end
