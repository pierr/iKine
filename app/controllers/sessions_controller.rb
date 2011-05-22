class SessionsController < ApplicationController
  
  def new
    @title = "S'authentifier"
  end
  
  #appeler pour se logger
  def create
    user = User.authenticate(params[:session][:email],
                               params[:session][:password])
      if user.nil?
        #Si on ne trouve pas d'utilisateur correspondant on envoi un message d'erreur et on repropose la page
        flash.now[:error] = "Mauvaise combinaisonn email/password."
        @title = "S'authentifier"
        render 'new'
      else
        flash[:success] = "Bienvenue sur iKine #{user.prenom} #{user.nom} !"
        sign_in user
        redirect_back_or user
        # Sign the user in and redirect to the user's show page.
      end
  end

  #appeler pour se delogger
  def destroy
      sign_out
      redirect_to root_path
  end
end
