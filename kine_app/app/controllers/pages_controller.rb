class PagesController < ApplicationController
  def home
    @mode="Home"
  end

  def contact
    @mode="Contact"
  end

end
