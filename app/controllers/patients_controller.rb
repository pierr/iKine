class PatientsController < ApplicationController
  def create
    @title="Creation"
  end

  def update
    @title="Modification"
  end
  
  def show
    @title="Viewing the page !"
    @patient = Patient.new
    @patient.nom = "son nom"
  end

end
