class PatientsController < ApplicationController
  helper_method :sort_column, :sort_direction
  
  autocomplete :ville, :nom, :full => true
  def index
    @title = "mode all"
    @patients = Patient.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 5, :page => params[:page])
        respond_to do |format|
        format.html
        format.js
        format.json { 
          patientsNom = Patient.where("nom like ?", "%#{params[:q]}%")
          patientsPrenom = Patient.where("prenom like ?", "%#{params[:q]}%")
          @patientsJson =patientsNom | patientsPrenom
          render :json => @patientsJson.as_json #.map(&:attributes)
          }
       end
  end
  
  def show
    @title="mode show"
    @patient = Patient.find(params[:id])
    @adresse = @patient.adresse
    @code_insee= @adresse.code_insee
    @ville = @code_insee.ville
    @departement = @code_insee .departement
    @civilite = @patient.civilite
    
    @ordonnances = @patient.ordonnances
    
  end
  
  def new
    @title="mode new"
    @patient = Patient.new
    @adresse = Adresse.new
    @ville = Ville.new
    
    @civiliteList = Civilite.all
  end

  def create
    @title="mode create"
    @patient = Patient.new(params[:patient])
    @adresse = Adresse.new(params[:adresse])
    
      ville_id = params[:ville][:ville_token]
    @adresse.code_insee_id= Ville.find(ville_id).code_insee.id
    
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
    
    @ville = @adresse.code_insee.ville

    @civiliteList = Civilite.all
  end
  
  def update
    @title="mode update"
    @patient = Patient.find(params[:id])
    @adresse = @patient.adresse
    @patient.attributes=(params[:patient])
    @adresse.attributes=(params[:adresse])
    
    ville_id = params[:ville][:ville_token]
    @adresse.code_insee_id= Ville.find(ville_id).code_insee.id
    
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

  private
  #trouve le nom de la colonne a trier
  def sort_column
    Patient.column_names.include?(params[:sort]) ? params[:sort] : "nom"
  end
  
  #trouve la direction de tri
  def sort_direction
     %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
