class Paper < ApplicationRecord
  belongs_to :economist

  validates_presence_of :name, :pages

  def self.total_papers
    count
  end

  def self.average_pages
    average(:pages)
  end

end
