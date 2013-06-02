class ChargesController < ApplicationController

	def new
		@user = current_user
  end

  def create
  	@user = current_user
  	binding.pry
  end
end
