class EconomistsController < ApplicationController

  def index
    @economists = Economist.all
    
  end
end
