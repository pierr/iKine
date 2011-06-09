class MedecinsController < ApplicationController
  def new
  end

  def show
  end

  def edit
  end

  def index
    respond_to do |format|
    format.html
    format.json { 
      medecinsNom = Medecin.where("nom like ?", "%#{params[:q]}%")
      medecinsPrenom = Medecin.where("prenom like ?", "%#{params[:q]}%")
      @medecinsJson =medecinsNom | medecinsPrenom
      render :json => @medecinsJson.as_json #.map(&:attributes)
}
end
  end

end
