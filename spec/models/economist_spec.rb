require 'rails_helper'


RSpec.describe Economist, type: :model do

  describe 'validations' do
    it { should validate_presence_of :name}
    it { should validate_presence_of :age}
    it { should validate_presence_of :city}

  end

  describe 'relationships' do
    it should { has_many :papers }
  end

  describe 'class-methods' do

    before :each do
      @johnmkeynes = Economist.create(name: "John Maynard Keynes", age: "deceased", city: "Cambridge", img_url: "https://upload.wikimedia.org/wikipedia/commons/7/75/Lord_Keynes.jpg")
      @friedrichhayek = Economist.create(name: "Friedrich Hayek", age: "deceased", city: "Vienna", img_url: "https://upload.wikimedia.org/wikipedia/commons/7/7f/Friedrich_Hayek_portrait.jpg")
      @karlmarx = Economist.create(name: "Karl Marx", age: "deceased", city: "Trier", img_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d4/Karl_Marx_001.jpg/1024px-Karl_Marx_001.jpg")
      @benbernanke = Economist.create(name: "Ben Bernanke", age: "65", city: "Augusta", img_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/3/3f/Ben_Bernanke_official_portrait.jpg/1024px-Ben_Bernanke_official_portrait.jpg")
      @janetyellen = Economist.create(name: "Janet Yellen", age: "72", city: "New York City", img_url: "https://upload.wikimedia.org/wikipedia/commons/f/f4/Janet_Yellen_official_Federal_Reserve_portrait.jpg")
      @miltonfriedman = Economist.create(name: "Milton Friedman", age: "94", city: "San Francisco", img_url: "https://upload.wikimedia.org/wikipedia/commons/2/20/Portrait_of_Milton_Friedman.jpg")
      @paper_1 = @johnmkeynes.papers.create(name: "The General Theory of Employment, Interest, and Money", pages: 472)
      @paper_2 = @johnmkeynes.papers.create(name:  "The Economic Consequences of the Peace", pages: 333)
      @paper_3 = @johnmkeynes.papers.create(name:  "A Treatise on Money", pages: 428)
    end

    it '.counts_papers' do
      expected = 3
      actual = @johnmkeynes.paper_count
      expect(actual).to eq(expected)
    end

    it '.average_ages' do
      expected = 77.0
      actual = Economist.average_age
      expect(actual).to eq(expected)
    end

    it '.hometowns' do
      expected = ["Vienna", "Trier", "Cambridge", "Augusta", "San Francisco", "New York City"]
      actual = Economist.hometowns
      expect(actual).to eq(expected)
    end
  end
end
