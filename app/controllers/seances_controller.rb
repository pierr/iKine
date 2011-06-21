# encoding: UTF-8
class SeancesController < ApplicationController
  def new
    @title ="Seances | Mode creation"
    @seance = Seance.new
    @seance.ordonnance = Ordonnance.last
  end

  def show
    @title = "Seance"
    @seance = Seance.find(params[:id])
    @patient = Patient.new
  end
  
  def index
    @title = "Toutes les séances"
    @seances = Seance.all
  end
 
  def create
    @seance = Seance.new(params[:seance])
    puts "________________________"
    puts @seance.ordonnance_id
    if @seance.save
      flash[:success] = "La creation de la seance numero #{@seance.id} est effectuee !"
      redirect_to seance_path(@seance)
    else
      print (@seance.errors)
      render 'new'
    end
  end
  

 
end
