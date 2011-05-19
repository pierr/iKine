class UsersController < ApplicationController
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
end
