class OrdonnancesController < ApplicationController
  before_filter :authenticate, :only => [:edit, :update,:index] #On veut que l'utilisateur soit autentifié avant d'accéder à la page
  
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
    if !params[:q].nil? #ici on teste si il 
      search
    else
    @title = "Toutes les ordonnances"
    @ordonnances = Ordonnance.paginate(:page => params[:page])
    end
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
  end
  


end
