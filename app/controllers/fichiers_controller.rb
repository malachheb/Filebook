class FichiersController < ApplicationController

  before_filter :require_login

  # GET /fichiers
  # GET /fichiers.json
  def index
    @fichiers = Fichier.where(:user_id => current_user.id)

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @fichiers }
    end
  end

  def tab
    @fichiers = Fichier.where(:user_id => current_user.id)
    status = params[:status]
    table_id ='files_table'
    trash = false
    if status == "uploaded"
      @fichiers = Fichier.where(:trash => false, :user_id => current_user.id)
      table_id = 'trash_table'
    elsif status == "trash"
      @fichiers = Fichier.where(:trash => true, :user_id => current_user.id)
      table_id = 'files_table'
      trash = true
    elsif status == "favori"
      @fichiers = current_user.myfavoris
    elsif status == "shared"
     @fichiers = current_user.sharedfromme
    end
    respond_to do |format|
      format.js { 
        render :partial => 'filetable', :locals => {:fichiers => @fichiers, :trash => trash , :table_id => 'files_table'}
      }
    end
  end
  
  def share 
    @fichier = Fichier.find(params[:id])
    respond_to do |format|
      format.html 
      format.js {render :action => "share"}
    end
    
  end

  def sharing 
    @fichier = Fichier.find(params[:id])
    myshared_tokens = params[:fichier][:myshared_tokens].split(',')
    myshared_tokens.each do |user|
      @user = User.find(user)
      SharedFichier.create(:owner => current_user, :dist => @user, :fichier => @fichier)
    end
    flash[:notice] = 'File was successfully shared with users : #{myshared_tokens}'
    respond_to do |format|
      format.html { redirect_to fichiers_url }
      format.json { head :no_content }
      format.js   { render :action => "sharing" }  
    end
    
  end
  
  def download 
    @fichier = Fichier.find(params[:id])
    send_file @fichier.data.path, :type => @fichier.data_content_type
  end

  # POST /fichiers/favori/1
  # POST /fichiers/favori/1.json
  def favori
    @fichier = Fichier.find(params[:id])
   # exist_favori = @fichier.users_favori.find(:user_id => current_user.id)
    unless @fichier.users_favori.exists?(current_user)
      @fichier.users_favori << current_user
      flash[:notice] = 'File was successfully added to favoris list'
    else
      @fichier.users_favori.delete(current_user)
      flash[:notice] = 'File was successfully removed to favoris list'
    end
    #Favori.create(:user => current_user, :fichier => @fichier)
    flash[:notice] = 'File was successfully added to favoris list'
    respond_to do |format|
      format.html { redirect_to fichiers_url }
      format.json { head :no_content }
      format.js   { render :nothing => true }  
    end
  end

  # GET /fichiers/1
  # GET /fichiers/1.json
  def show
    @fichier = Fichier.find(params[:id])
    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @fichier }
      format.js {render :action => "show"}
    end
  end

  # GET /fichiers/new
  # GET /fichiers/new.json
  def new
    @fichier = Fichier.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @fichier }
      format.js {render :action => "new"}
    end
  end

  # GET /fichiers/1/edit
  def edit
    @fichier = Fichier.find(params[:id])
    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @fichier }
      format.js {render :action => "new"}
    end
  end

  # POST /fichiers
  # POST /fichiers.json
  def create
    @fichier = Fichier.new(params[:fichier])
    @fichier.user_id = current_user.id
    respond_to do |format|
      if @fichier.save
        flash[:notice] = 'File was successfully created.'
        format.html { redirect_to @fichier}
        format.json { render :json => @fichier, :status => :created, :location => @fichier }
	format.js   {render :action => "create",  :locals => {:type_render => "post"}}
      else
        flash[:error] = 'Error while Creating the File'
        format.html { render :action => "new" }
        format.json { render :json => @fichier.errors, :status => :unprocessable_entity }
        format.js   { render :action => "create", :layout => false}
      end
    end
  end

  # PUT /fichiers/1
  # PUT /fichiers/1.json
  def update
    @fichier = Fichier.find(params[:id])
    respond_to do |format|
      if @fichier.update_attributes(params[:fichier])
         flash[:notice] = 'File was successfully updated.'
        format.html { redirect_to @fichier }
        format.json { head :no_content }
	format.js   { render :action => "create", :locals => {:type_render => "put"}}
      else
        flash[:error] = 'Error while updating the File.'
        format.html { render :action => "edit" }
        format.json { render :json => @fichier.errors, :status => :unprocessable_entity }
        format.js   { render :action => "create"}
      end
    end
  end

  # DELETE /fichiers/1
  # DELETE /fichiers/1.json
  def destroy
    @fichier = Fichier.find(params[:id])
    @fichier.destroy
    flash[:notice] = 'File was Successfully deleted.'
    respond_to do |format|
      format.html { redirect_to fichiers_url }
      format.json { head :no_content }
      format.js   { render :nothing => true }  
    end
  end

  # move a file to trash
  # trash /fichiers/:id
  def trash 
    @fichier = Fichier.find(params[:id])
    @fichier.trash = true
    @fichier.save
    flash[:notice] = 'File was successfully moved to trash.'
    respond_to do |format|
      format.html { redirect_to fichiers_url }
      format.json { head :no_content }
      format.js   { render :nothing => true }  
    end
  end

  # restore a file from trash
  # trash /fichiers/:id
  def restore
    @fichier = Fichier.find(params[:id])
    @fichier.trash = false
    @fichier.save
    flash[:notice] = 'File was successfully retored from trash.'
    respond_to do |format|
      format.html { redirect_to fichiers_url }
      format.json { head :no_content }
      format.js   { render :nothing => true }  
    end
  end
  
end
