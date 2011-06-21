class VillesController < ApplicationController
  # GET /villes
  # GET /villes.xml
  # GET /villes.json
  def index
    @villes = Ville.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @villes }
      format.json { 
          villeJson = Ville.where("nom like ?", "%#{params[:q]}%")
          render :json => villeJson.as_json #.map(&:attributes)
        }
    end
  end

  # GET /villes/1
  # GET /villes/1.xml
  def show
    @ville = Ville.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @ville }
    end
  end

  # GET /villes/new
  # GET /villes/new.xml
  def new
    @ville = Ville.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @ville }
    end
  end

  # GET /villes/1/edit
  def edit
    @ville = Ville.find(params[:id])
  end

  # POST /villes
  # POST /villes.xml
  def create
    @ville = Ville.new(params[:ville])

    respond_to do |format|
      if @ville.save
        format.html { redirect_to(@ville, :notice => 'Ville was successfully created.') }
        format.xml  { render :xml => @ville, :status => :created, :location => @ville }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @ville.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /villes/1
  # PUT /villes/1.xml
  def update
    @ville = Ville.find(params[:id])

    respond_to do |format|
      if @ville.update_attributes(params[:ville])
        format.html { redirect_to(@ville, :notice => 'Ville was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @ville.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /villes/1
  # DELETE /villes/1.xml
  def destroy
    @ville = Ville.find(params[:id])
    @ville.destroy

    respond_to do |format|
      format.html { redirect_to(villes_url) }
      format.xml  { head :ok }
    end
  end
end
