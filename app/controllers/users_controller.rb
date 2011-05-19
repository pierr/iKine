class UsersController < ApplicationController
   before_filter :authenticate, :only => [:edit, :update] #Pour recqérir l'autentification d'un utilisateur
  def new
    @user = User.new
    @title ="Sign up"
  end
  def show
     @user = User.find(params[:id])
     @title = @user.surname
   end
   #Permet de creer un nouvel utilisateur.
   def create 
     @user = User.new(params[:user])
     if @user.save
       sign_in @user #On le logue automatiquement
       flash[:success] = "Bienvenue sur iKine ".concat(@user.firstname).concat(" !")
       redirect_to user_path(@user)
      else
        @title = "Sign Up"
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
        @title = "Edit user"
        render 'edit'
      end
    end
    
    private
    
    def authenticate
          deny_access unless signed_in?
    end
end
