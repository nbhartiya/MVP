class HomeController < ApplicationController
  
  skip_before_filter :authenticate_user!
  

  def howitworks
  end

  def teamandjobs
  end

  def index
  end

  def tos
  end

  def philosophy
  end

  def unsubscribe
  end

  def privacy
  end

  def raffle
    redirect_to "home/index"
  end

end
