class Paper < ApplicationRecord
  belongs_to :economist

  validates_presence_of :name, :pages
end
