class RdvsController < ApplicationController
  # GET /rdvs
  # GET /rdvs.xml
  def index
    @rdvs = Rdv.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @rdvs }
    end
  end

  # GET /rdvs/1
  # GET /rdvs/1.xml
  def show
    @rdv = Rdv.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @rdv }
    end
  end

  # GET /rdvs/new
  # GET /rdvs/new.xml
  def new
    @rdv = Rdv.new
     if(!params[:patient_id].nil?)
        @rdv.patient = Patient.find(params[:patient_id])
      end

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @rdv }
    end
  end

  # GET /rdvs/1/edit
  def edit
    @rdv = Rdv.find(params[:id])
  end

  # POST /rdvs
  # POST /rdvs.xml
  def create
    @rdv = Rdv.new(params[:rdv])

    respond_to do |format|
      if @rdv.save
        format.html { redirect_to(@rdv, :notice => 'Rdv was successfully created.') }
        format.xml  { render :xml => @rdv, :status => :created, :location => @rdv }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @rdv.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /rdvs/1
  # PUT /rdvs/1.xml
  def update
    @rdv = Rdv.find(params[:id])

    respond_to do |format|
      if @rdv.update_attributes(params[:rdv])
        format.html { redirect_to(@rdv, :notice => 'Rdv was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @rdv.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /rdvs/1
  # DELETE /rdvs/1.xml
  def destroy
    @rdv = Rdv.find(params[:id])
    @rdv.destroy

    respond_to do |format|
      format.html { redirect_to(rdvs_url) }
      format.xml  { head :ok }
    end
  end
end
