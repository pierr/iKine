module SeancesHelper
  #Cette methode sert à récupérer une  seance qui est passé en paramètre pour une page.
  #Elle crée une variable @seance avec le retour du Seance.find
  def seance
    if !params[:seance].nil?
      @seance = Seance.find(params[:seance])
    end
  end
end
