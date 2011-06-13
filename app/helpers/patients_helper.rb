module PatientsHelper
  #Cette methode sert à récupérer un patient qui est passé en paramètre pour une page.
  #Elle crée une variable @patient avec le retour du Patient.find
  def patient
    if !params[:patient].nil?
      @patient = Patient.find(params[:patient])
    end
  end
end
