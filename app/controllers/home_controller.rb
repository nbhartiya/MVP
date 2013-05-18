class HomeController < ApplicationController
  
  skip_before_filter :authenticate_user!
  

  def howitworks
  end

  def teamandjobs
  end

  def contactus
  end


end
