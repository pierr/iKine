class SeancesController < ApplicationController
  def new
    @seance = Seance.new
    @title ="Nouvelle Seance"
  end

  def show
    @seance = Seance.find(:first)
  end

end
