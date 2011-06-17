# encoding: UTF-8
class BilansController < ApplicationController
  include OrdonnancesHelper
  # GET /bilans
  # GET /bilans.xml
  def index
    @bilans = Bilan.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @bilans }
    end
  end

  # GET /bilans/1
  # GET /bilans/1.xml
  def show
    @bilan = Bilan.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @bilan }
    end
  end

  # GET /bilans/new
  # GET /bilans/new.xml
  def new
    #On essaye de récupérer une ordonnance qui vient de la page précadente
    ordonnance
    #Si elle n'existe pas 
    #debugger
    if @ordonnance.nil? 
      redirect_to new_ordonnance_path , :notice => 'Avant de créer un bilan il faut créer une ordonannce' 
    else
    @bilan = Bilan.new
    @bilan.ordonnance = @ordonnance
    puts 'test bilan'
    puts @bilan.ordonnance.numero
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @bilan }
    end
    end
  end

  # GET /bilans/1/edit
  def edit
    @bilan = Bilan.find(params[:id])
  end

  # POST /bilans
  # POST /bilans.xml
  def create
    @bilan = Bilan.new(params[:bilan])

    respond_to do |format|
      if @bilan.save
        format.html { redirect_to(@bilan, :notice => 'Bilan was successfully created.') }
        format.xml  { render :xml => @bilan, :status => :created, :location => @bilan }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @bilan.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /bilans/1
  # PUT /bilans/1.xml
  def update
    @bilan = Bilan.find(params[:id])

    respond_to do |format|
      if @bilan.update_attributes(params[:bilan])
        format.html { redirect_to(@bilan, :notice => 'Bilan was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @bilan.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /bilans/1
  # DELETE /bilans/1.xml
  def destroy
    @bilan = Bilan.find(params[:id])
    @bilan.destroy

    respond_to do |format|
      format.html { redirect_to(bilans_url) }
      format.xml  { head :ok }
    end
  end
end
