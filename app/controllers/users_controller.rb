class UsersController < ApplicationController
  def new
    @user = User.new
    @mode ="Sign up"
  end
  def show
     @user = User.find(params[:id])
     @mode = @user.surname
   end
   #Permet de creer un nouvel utilisateur.
   def create 
     @user = User.new(params[:user])
     if @user.save
       flash[:success] = "Bienvenue sur iKine ".concat(@user.firstname).concat(" !")
       redirect_to user_path(@user)
      else
        @mode = "Sign Up"
        render 'new'
      end
  end
end
