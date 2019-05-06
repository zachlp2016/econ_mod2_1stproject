class Economist < ApplicationRecord

  has_many :papers
  validates_presence_of :name, :age, :city


  def paper_count
    self.papers.count
  end

  def self.average_age
    select(:age).where("age > 0").average(:age)
  end

  def self.hometowns
    distinct(:city).pluck(:city)
  end

  def self.sort_by(params)
    if params[:sort] == "name"
      order(:name)
    elsif params[:sort] == "age"
      order(:age)
    elsif params[:sort] == "city"
      order(:city)
    end
  end
end
