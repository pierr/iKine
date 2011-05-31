class PatientsController < ApplicationController
  autocomplete :ville, :nom, :full => true
  def index
    @title = "mode all"
    @patients = Patient.paginate :page => params[:page] , :per_page => 1
  end
  
  def show
    @title="mode show"
    @patient = Patient.find(params[:id])
    @adresse = @patient.adresse
    
    @villeList = @adresse.ville
    @departementList = @villeList .departement
    @civiliteList = @patient.civilite
  end
  
  def new
    @title="mode new"
    @patient = Patient.new
    @adresse = Adresse.new
    
    @villeList = Ville.all
    @departementList = Departement.all
    @civiliteList = Civilite.all
  end

  def create
    @title="mode create"
    @patient = Patient.new(params[:patient])
    @adresse = Adresse.new(params[:adresse])
    if(@patient.valid? && @adresse.valid?)
       @adresse.save
       @patient.adresse=@adresse # pour setter correctement l'adresse id de patient
       @patient.save
       redirect_to(@patient) # aucune erreur => on affiche la page en mode view
    else # sinon, alors on a des erreurs et on réaffiche la page en mode new
       render 'new'
    end
  end

  def edit
    @title="mode edit"
    @patient = Patient.find(params[:id])
    @adresse = @patient.adresse

    @villeList = Ville.all
    @departementList = Departement.all
    @civiliteList = Civilite.all
  end
  
  def update
    @title="mode update"
    @patient = Patient.find(params[:id])
    @adresse = @patient.adresse
    @patient.attributes=(params[:patient])
    @adresse.attributes=(params[:adresse])
    if(@patient.valid? && @adresse.valid?)
       @adresse.save
       @patient.adresse=@adresse # pour setter correctement l'adresse id de patient mais je pense que c'est pas utile en mode edit... ça dépendra de si l'adresse était existante blablabla
       @patient.save
       redirect_to(@patient) # aucune erreur => on affiche la page en mode view
    else
       render 'edit'
    end
  end

  def destroy
    @title="mode destroy"
    @patient = Patient.find(params[:id])
    @adresse = @patient.adresse
    @adresse.delete
    @patient.delete 
    redirect_to patients_path # FIXME : Audric : FIXED :)
  end  

end
