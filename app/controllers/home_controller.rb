class HomeController < ApplicationController
  
  skip_before_filter :authenticate_user!
  
  def index
  end

  def howitworks
  end

  def teamandjobs
  end

  def tos
  end

  def contactus
  end

  def blog
  end

end
