require 'rails_helper'


RSpec.describe Paper, type: :model do

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :pages }

  end

  describe 'relationships' do
    it should { belongs_to :economist }
  end

end
