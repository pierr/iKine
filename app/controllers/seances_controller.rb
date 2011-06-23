# encoding: UTF-8

class SeancesController < ApplicationController
    helper_method :sort_column, :sort_direction
  
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
    @seances = Seance.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 5, :page => params[:page])

    respond_to do |format|
        format.html
        format.js
        format.json { 
          @seanceJson = Seance.where("patient.nom like ?", "%#{params[:q]}%")
          render :json => @seanceJson.as_json #.map(&:attributes)
          }
       end
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
  
  def update
    @seance = Seance.find(params[:id])
    numero = @seance.id
    if @seance.update_attributes(params[:seance])
        flash[:success] = "seance mise a jour."
        redirect_to @seance
    else
      flash[:error] = "La seance n'a pas ete mise a jour."
        @title = "Modification de la seance numero #{numero}"
        render 'edit'
      end
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
  
  def sort_column
    #puts "ORDONNANCE COLONNE NAME" 
    #puts Ordonnance.column_names
    Seance.column_names.include?(params[:sort]) ? params[:sort] : "id"
  end
  
  #trouve la direction de tri
  def sort_direction
     %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
   
end
