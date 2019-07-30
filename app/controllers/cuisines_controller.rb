class CuisinesController < ApplicationController

  def index
    @cuisines = Cuisine.all
  end
  
  def show
    
  end
  
end
