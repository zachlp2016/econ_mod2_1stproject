class Economist < ApplicationRecord

  has_many :papers
  validates_presence_of :name, :age, :city


  def paper_count
    self.papers.count
  end
end
