class FichiersController < ApplicationController
  # GET /fichiers
  # GET /fichiers.json
  def index
    @fichiers = Fichier.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @fichiers }
    end
  end

  # GET /fichiers/1
  # GET /fichiers/1.json
  def show
    @fichier = Fichier.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @fichier }
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

    respond_to do |format|
      if @fichier.save
        format.html { redirect_to @fichier, :notice => 'Fichier was successfully created.' }
        format.json { render :json => @fichier, :status => :created, :location => @fichier }
	format.js   {render :action => "create"}
      else
        format.html { render :action => "new" }
        format.json { render :json => @fichier.errors, :status => :unprocessable_entity }
         format.js { render :action => "create"}
      end
    end
  end

  # PUT /fichiers/1
  # PUT /fichiers/1.json
  def update
    @fichier = Fichier.find(params[:id])

    respond_to do |format|
      if @fichier.update_attributes(params[:fichier])
        format.html { redirect_to @fichier, :notice => 'Fichier was successfully updated.' }
        format.json { head :no_content }
	format.js { render :action => "create"}
      else
        format.html { render :action => "edit" }
        format.json { render :json => @fichier.errors, :status => :unprocessable_entity }
        format.js { render :action => "create"}
      end
    end
  end

  # DELETE /fichiers/1
  # DELETE /fichiers/1.json
  def destroy
    @fichier = Fichier.find(params[:id])
    @fichier.destroy

    respond_to do |format|
      format.html { redirect_to fichiers_url }
      format.json { head :no_content }
      format.js   { render :nothing => true }  
    end
  end
end
