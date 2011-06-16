module OrdonnancesHelper
  #Cette methode sert à récupérer une ordonnance qui est passé en paramètre pour une page.
  #Elle crée une variable @ordonnance avec le retour du Ordonnance.find
  def ordonnance
    if !params[:ordonnance].nil?
      @ordonnance = Ordonnance.find(params[:ordonnance])
      #puts @ordonnance
    end
  end
end
