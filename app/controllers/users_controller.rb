class UsersController < ApplicationController
  
  def new
    @user = User.new
  end

  
  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to root_url, :notice => "Signed up!"
    else
      render "new"
    end
  end
  
  def index
  #  unless params[:q].nil?
      @users = User.where("pseudo like ?", "%#{params[:q]}%")
   # else
    #  @users = User.all
    # end
    respond_to do |format|
      format.html
      format.json { render :json => @users.map { |u| {:id => u.id, :name => u.pseudo}} }
    end
  end

  # Get /users
  # Find users to follow
  def find
    @users = User.all
    respond_to do  |format|
      format.html
    end
  end

  def follow
    @user = User.find(params[:id]).where
    Follow.create(:userfrom => current_user, :userto => @user)
    respond_to do |format|
      format.js { render :nothing => true }  
    end
  end



  # def showtopics
  #   @topics = current_user.topics
  #   respond_to do |format|
  #     format.html
  #   end

  # end

end
