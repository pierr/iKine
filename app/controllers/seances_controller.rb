class SeancesController < ApplicationController
  def new
    @title ="Seances | Mode creation"
    @seance = Seance.new
    @patient = Patient.new
  end

  def show
    @title = "Seance"
    @seance = Seance.find(params[:id])
  end
  
  def index
    @title = "Rechercher une/des seance(s)"
  end
 
  def create
    @seance = Seance.new(params[:seance])
    if @seance.save
      flash[:success] = "La creation de la seance numero #{@seance.id} est effectuee !"
      redirect_to seance_path(@seance)
    else
      print (@seance.errors)
      render 'new'
    end
  end

 
end
