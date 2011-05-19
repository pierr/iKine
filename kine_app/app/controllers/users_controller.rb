class UsersController < ApplicationController
  def new
    @mode ="Sign up"
  end
  def show
     @user = User.find(params[:id])
     @mode = @user.surname
   end

end
