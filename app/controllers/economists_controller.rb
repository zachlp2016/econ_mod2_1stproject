class EconomistsController < ApplicationController

  def index
    @economists = Economist.all
    @average_age = Economist.average_age
    @total_papers = Economist.total_papers
    @average_pages = Economist.average_pages

    age = params[:age]
    name = params[:name]
    if age != nil
      @economists = Economist.where(age: (params[:age]))
    elsif name != nil
      @economists = Economist.where(name: (params[:name]))
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
