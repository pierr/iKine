# encoding: UTF-8
class SeancesController < ApplicationController
  def new
    @title ="Seances | Mode creation"
    @seance = Seance.new
    @seance.ordonnance = Ordonnance.last
    user_pre
  end

  def show
    @title = "Seance"
    @seance = Seance.find(params[:id])
    @patient = Patient.new
  end
  
  def index
    @title = "Rechercher une/des seance(s)"
    @seances = Seance.all.paginate(:per_page => 5, :page => params[:page])
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
  
  def destroy
    @seance = Seance.find(params[:id])
    numero = @seance.id
    if @seance.destroy
      flash[:success] = "La seance numero #{numero} a ete detruite."
      redirect_to seances_path
    else
      flash[:error] = "La seance numero #{numero} n' a pas ete detruite."
      redirect_to seance_path(@seance)
    end
  end
  
  def edit
    @seance = Seance.find(params[:id])
    numero = @seance.id
    patient_pre
    @title = "Modification de la seance numero #{numero}"
    user_pre
    ordonnance_pre
  end
  
  def patient_pre
    @patient_pre = [@seance.patient]
  end
  
  def user_pre
    @user_pre = @seance.user.nil? ? [current_user] : [@seance.user] 
  end 
  
  def ordonnance_pre
    @ordonnance_pre = [@seance.ordonnance]
  end
   
end
