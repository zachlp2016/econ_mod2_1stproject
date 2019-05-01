class Economist < ApplicationRecord

  has_many :papers
  validates_presence_of :name, :age, :city

end
