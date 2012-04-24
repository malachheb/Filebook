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
    @users = User.where("id != ?", current_user.id)
    @users = @users - current_user.following
    respond_to do  |format|
      format.html
    end
  end


  def following
    @users =  current_user.following
    respond_to do  |format|
      format.html
    end
  end

  def followers
    @users =  current_user.followers
    respond_to do  |format|
      format.html
    end
  end

  def follow
    @user = User.find(params[:id])
    Follow.create(:userfrom => current_user, :userto => @user)
    flash[:notice] = "Your are now Following the user #{@user.pseudo}"
    respond_to do |format|
      #format.js { render :nothing => true }  
      format.js   { render :action => "follow" }
    end
  end

  def unfollow
    @user = User.find(params[:id])
    current_user.following.delete(@user)
    flash[:notice] = "your are now Unfollowing the user #{@user.pseudo}"
    respond_to do |format|
      format.js { render :action => "unfollow" }  
    end
  end

end
