class UsersController < ApplicationController
  def new
    @mode ="Sign up"
  end
  def show
     @mode ="Vue"
     @user = User.find(params[:id])
   end

end
