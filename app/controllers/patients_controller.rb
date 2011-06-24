# encoding: UTF-8
class PatientsController < ApplicationController
  autocomplete :ville, :nom, :full => true
  def index
    @title = "mode all"
    @patients = Patient.paginate :page => params[:page] , :per_page => 10
        respond_to do |format|
        format.html
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
    @onglets = ["Coordonnées","Dossier médical", "Carte"]
    @onglets_selected = 1
    
    
  end
  
  def new
    @title="mode new"
    @patient = Patient.new
    @adresse = Adresse.new
    @ville = Ville.new
      if (!params[:rdv].nil?)
        @retour_rdv=true
      else
        @retour_rdv=false
      end
    
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
       puts "_____________________RDV______________"
       puts params[:rdv]
       if !params[:rdv].nil?
           redirect_to(:controller=>"rdvs", :action => "new", :patient_id => @patient)
        else
          redirect_to(@patient) # aucune erreur => on affiche la page en mode view
        end
    else # sinon, alors on a des erreurs et on réaffiche la page en mode new
       render 'new'
    end
  end
  
  #même fonction que create mais avec un retour vers un nouveau rendez-vous
  def retour_to_rdv
     @title="mode create"
     @patient = Patient.new(params[:patient])
     @adresse = Adresse.new(params[:adresse])

       ville_id = params[:ville][:ville_token]
     @adresse.code_insee_id= Ville.find(ville_id).code_insee.id


     if(@patient.valid? && @adresse.valid?)
        @adresse.save
        @patient.adresse=@adresse # pour setter correctement l'adresse id de patient
        @patient.save
        puts "_________________ICI_________________"
        redirect_to(:controller=>"rdvs", :action => "new", :patient_id => @patient) # aucune erreur => on affiche la page en mode view
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
  
  def map
     @patient = Patient.find(params[:id])
     @adresse = @patient.adresse
     render 'map'
  end
end
