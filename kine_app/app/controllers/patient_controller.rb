class PatientController < ApplicationController
  def create
    @mode="Creation"
  end

  def update
    @mode="Modification"
  end

end
