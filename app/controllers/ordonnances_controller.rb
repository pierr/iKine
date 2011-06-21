class OrdonnancesController < ApplicationController
  before_filter :authenticate, :only => [:edit, :update,:index,:new] #On veut que l'utilisateur soit autentifié avant d'accéder à la page
  before_filter :def_onglets #On aura les variables pour les onglets qui seront chargés par défaut
  helper_method :sort_column, :sort_direction
  
  #Appellé pour la Page de creation d'une ordonnance
  def new
    @onglets = ["Details"]
    @onglet_selected = 1
    @title = "Ordonnances | Mode creation" 
    @ordonnance = Ordonnance.new
    #@ordonnance.bilan = Bilan.new
    patient
    medecin
    
  end

  #visualiser une ordonnance
  def show
    ordonnance 
    patient
    medecin
    @bilan = @ordonnance.bilan
    @title = "Ordonnance"
  end

  #Afficher une liste d'ordonnance
  def index
    @title = "Rechercher une/des ordonnance(s)"
    @ordonnances = Ordonnance.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 5, :page => params[:page])
    respond_to do |format|
        format.html
        format.json { 
          @ordonnanceJson = Ordonnance.where("numero like ?", "%#{params[:q]}%")
          render :json => @ordonnanceJson.as_json #.map(&:attributes)
          }
       end
  end

  #Modifier une ordonnance
  def edit
    ordonnance
    patient
    medecin
    @title = "Modification de l'ordonnance"
  end
  
  #Supprimer une ordonance
  def destroy
    ordonnance
    numero = @ordonnance.numero
    if @ordonnance.destroy
      flash[:success] = "L'ordonnance numero #{numero} a ete detruite."
      redirect_to ordonnances_path
    else
      flash[:error] = "L'ordonnance numero #{numero} n' a pas ete detruite."
      redirect_to ordonnance_path(@ordonnance)
    end
  end
  
  def create
    @ordonnance = Ordonnance.new(params[:ordonnance])
    if @ordonnance.save
      if !@ordonnance.date.nil?
        
      end
      flash[:success] = "La creation de l'ordonnance numero #{@ordonnance.numero} est effectuee !"
      redirect_to ordonnance_path(@ordonnance)
    else
      print (@ordonnance.errors)
      render 'new'
    end
  end
  
  def update
    ordonnance
    if @ordonnance.update_attributes(params[:ordonnance])
        flash[:success] = "Ordonnance mise a jour."
        redirect_to @ordonnance
    else
      flash[:error] = "L'ordonnance n'a pas ete mise a jour."
        @title = "Modifier user"
        render 'edit'
      end
    end
  
  private
  #trouve le nom de la colonne a trier
  def sort_column
    puts "ORDONNANCE COLONNE NAME" 
    puts Ordonnance.column_names
    Ordonnance.column_names.include?(params[:sort]) ? params[:sort] : "numero"
  end
  
  #trouve la direction de tri
  def sort_direction
     %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
  def def_onglets
    @onglets = ["Details","Bilan","Facturation"]
    @onglet_selected = 1
  end
  def ordonnance
    @ordonnance = Ordonnance.find(params[:id])
  end
  
  #Permet de charger le patient si il est definie sinon on charge le dernier cree par defaut
  def patient
    if !@ordonnance.patient.nil?
      @patient = @ordonnance.patient
    elsif !params[:patient].nil?
      @patient = params[:patient]
    end
    if !@patient.nil?
      @patient_pre = [@patient]
    end
  end
  def medecin
    if !@ordonnance.medecin.nil?
      @medecin = @ordonnance.medecin
    elsif !params[:medecin].nil?
      @medecin = params[:medecin]
    end
    if !@medecin.nil?
      @medecin_pre = [@medecin]
    end
  end
end
