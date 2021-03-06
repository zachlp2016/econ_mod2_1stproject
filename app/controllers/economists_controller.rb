class EconomistsController < ApplicationController

  def index
    @economists = Economist.all
    @average_age = Economist.average_age
    @total_papers = Paper.total_papers
    @average_pages = Paper.average_pages
    @hometowns = Economist.hometowns


    if params[:sort] != nil
      if params[:sort] == "name" || params[:sort] == "age" || params[:sort] == "city"
        @economists = Economist.sort_by(params)
      end
    end

    age = params[:age]
    if age != nil
      @economists = Economist.where(age: (params[:age]))
    end
  end

  def show
    @economist = Economist.find(params[:id])
  end

  def new
    @economist = Economist.new
  end

  def create
    @new_economist = Economist.create(strong_params)
    @new_economist.save
    redirect_to economists_path
  end

  private

  def strong_params
    params.require(:economist).permit(:name, :age, :city, :image)
  end
end
