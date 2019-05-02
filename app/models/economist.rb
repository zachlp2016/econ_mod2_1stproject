class Economist < ApplicationRecord

  has_many :papers
  validates_presence_of :name, :age, :city


  def paper_count
    self.papers.count
  end

  def self.average_age
    select(:age).where("age > 0").average(:age).to_s.to_f
  end

  def self.hometowns
    distinct(:city).pluck(:city)
  end
end
