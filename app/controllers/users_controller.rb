#Controller pour toutes les vues Users

class UsersController < ApplicationController
  
  #Condition a verifier pour  effectuer certaines methodes 
   before_filter :authenticate, :only => [:edit, :update,:index] #Pour recqérir l'autentification d'un utilisateur
   before_filter :correct_user, :only => [:edit, :update]#on vérifie également la correspondance
   before_filter :admin_user,   :only => :destroy
  
  #methode pour creer un utilisateur
  def new
    redirect_to(root_path) unless !signed_in?
    @user = User.new
    @title ="Sign up"
  end
  
  #methode qui permmet d'afficher un utilisateur
  def show
    @user = User.find(params[:id])
    @title = @user.nom
  end
  
  # Methode appellee par defaut lors du chargement de la page avec tous les utilisateurs
  def index
      @title = "All users"
      @users = User.paginate(:page => params[:page])
  end
  
  #Permet de creer un nouvel utilisateur.
  def create
    redirect_to(root_path) unless !signed_in? #si l'utilisateur est loggué il n'a pas de raison de creer un nouvel user
    @user = User.new(params[:user])
    if @user.save
      sign_in @user #On le logue automatiquement
      flash[:success] = "Bienvenue sur iKine #{@user.prenom} #{user.nom} !"
      redirect_to user_path(@user)
    else
      @title = "S'authentifier"
      render 'new'
    end
  end
  
  #charge l'utilisateur a modifier
  def edit
      @user = User.find(params[:id])
      @title = "Edit user"
  end
  
  #enregistre l'utilisateur corresponant
  def update
      @user = User.find(params[:id])
      if @user.update_attributes(params[:user])
        flash[:success] = "Profile mis a jour."
        redirect_to @user
      else
        @title = "Modifier user"
        render 'edit'
      end
    end
    
  #Methode qui permet de détruire un utilisateur
  def destroy
    user = User.find(params[:id]) 
    if user == current_user  && user.admin?
      flash[:error] = "Vous ne pouvez pas vous detruire vous etes un admin."
      redirect_to users_path
    elsif user.admin?
      flash[:error] = "Vous ne pouvez pas vous detruire #{user.prenom} #{user.nom} qui est un admin."
      redirect_to users_path
    else 
      name = " #{user.nom} #{user.prenom}"
      user.destroy
      flash[:success] = name + " a ete detruit."
      redirect_to users_path
    end
  end
  
  def search

    @users = User.paginate(:page => params[:page],:conditions => ['nom like ?', "%#{params[:q]}%"])
    if @users.nil? || @users.size == 0
      flash[:error] = "Aucun utilisateur n'a le prenom #{params[:q]}"
    else 
      flash[:success] = "Voici les utilisateurs qui on pour nom #{params[:q]}"
    end
    render 'index'
  end
    #Les methodes en dessous sont privees
    private
    
    #refuse l'accès si on est pas loggué
    def authenticate
          deny_access unless signed_in?
    end
    
    #V�rifie que la pages concernant l'utilisateur auquel on veut accéder est celle de la personne loguée
    def correct_user
         @user = User.find(params[:id])
         isUser = current_user?(@user)
         flash[:success] = "Vous ne pouvez pas avoir acces a cette page!" unless isUser
         redirect_to(root_path) unless isUser
    end
    
    #Methode qui permet de vérifier si l'utilisateur est l'admin sinon on le redirige vers la page d'accueil
    def admin_user
          redirect_to(root_path) unless current_user.admin?
    end
end