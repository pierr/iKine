class OrdonnancesController < ApplicationController
  before_filter :authenticate, :only => [:edit, :update,:index] #On veut que l'utilisateur soit autentifié avant d'accéder à la page
  helper_method :sort_column, :sort_direction
  
  #Appellé pour la Page de creation d'une ordonnance
  def new
    @title = "Ordonnances | Mode creation" 
    @ordonnance = Ordonnance.new
  end

#visualiser une ordonnance
  def show
  #  @ordonnance = Ordonnance.
    @title = "Ordonnance"
  end

#Afficher une liste d'ordonnance
  def index
    @title = "Rechercher une/des ordonnance(s)"
      @ordonnances = Ordonnance.search(params[:search]).order(sort_column + " " + sort_direction).paginate(:per_page => 5, :page => params[:page])
  end

  #Modifier une ordonnance
  def edit
    @title = "Modification de l'ordonnance"
  end
  
  #Supprimer une ordonance
  def delete
    @title = "Delete"
  end
  private
  
  #Methode de recherche d'une ordonnance
  def search
    @ordonnances = Ordonnance.all
  end
  
  def sort_column
    Ordonnance.column_names.include?(params[:sort]) ? params[:sort] : "numero"
  end
  def sort_direction
     %w[asc desc].include?(params[:direction]) ? params[:direction] : "asc"
  end
end
