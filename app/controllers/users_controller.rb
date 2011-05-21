class UsersController < ApplicationController
   before_filter :authenticate, :only => [:edit, :update,:index] #Pour recqérir l'autentification d'un utilisateur
   before_filter :correct_user, :only => [:edit, :update]#on vérifie également la correspondance
  def new
    @user = User.new
    @title ="Sign up"
  end
  def show
     @user = User.find(params[:id])
     @title = @user.nom
  end
  
  def index
      @title = "All users"
      @users = User.paginate(:page => params[:page])
  end
  
  #Permet de creer un nouvel utilisateur.
  def create 
     @user = User.new(params[:user])
     if @user.save
       sign_in @user #On le logue automatiquement
       flash[:success] = "Bienvenue sur iKine ".concat(@user.prenom).concat(" !")
       redirect_to user_path(@user)
      else
        @title = "S'authentifier"
        render 'new'
      end
  end
  
  def edit
      @user = User.find(params[:id])
      @title = "Edit user"
  end
  
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
    
    private
    #refuse l'accès si on est pas loggué
    def authenticate
          deny_access unless signed_in?
    end
    #Vérifie que la pages concernant l'utilisateur auquel on veut accéder est celle de la personne loguée
    def correct_user
         @user = User.find(params[:id])
         isUser = current_user?(@user)
         flash[:success] = "Vous ne pouvez pas avoir acces a cette page!" unless isUser
         redirect_to(root_path) unless isUser
    end
end
