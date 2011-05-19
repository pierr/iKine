class PagesController < ApplicationController
  def home
    @mode="Home"
  end

  def contact
    @mode="Contact"
  end
  def help
     @mode = "Help"
  end
  def about 
    @mode="About"
  end 
end
