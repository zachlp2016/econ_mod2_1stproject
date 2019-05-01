require 'rails_helper'


RSpec.describe 'When I visit the index page', type: :feature do
  context 'as a visitor'
  describe 'All of the papers show up correctly' do
    before :each do
      @johnmkeynes = Economist.create(name: "John Maynard Keynes", age: "deceased", city: "Cambridge", img_url: "https://upload.wikimedia.org/wikipedia/commons/7/75/Lord_Keynes.jpg")
      @friedrichhayek = Economist.create(name: "Friedrich Hayek", age: "deceased", city: "Vienna", img_url: "https://upload.wikimedia.org/wikipedia/commons/7/7f/Friedrich_Hayek_portrait.jpg")
      @karlmarx = Economist.create(name: "Karl Marx", age: "deceased", city: "Trier", img_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d4/Karl_Marx_001.jpg/1024px-Karl_Marx_001.jpg")
      @paper_1 = @johnmkeynes.papers.create(name: "The General Theory of Employment, Interest, and Money", pages: 472)
      @paper_2 = @johnmkeynes.papers.create(name:  "The Economic Consequences of the Peace", pages: 333)
      @paper_3 = @johnmkeynes.papers.create(name:  "A Treatise on Money", pages: 428)

      @johnmkeynes.papers << @paper_1
      @johnmkeynes.papers << @paper_2
      @johnmkeynes.papers << @paper_3

    end

    it 'sees a list of an economists papers with the following information' do

      visit '/economists'

      within "#economist-papers-#{@paper_1.id}" do
        expect(page).to have_content("Name: #{@paper_1.name}")
        expect(page).to have_content("Pages: #{@paper_1.pages}")
      end

      within "#economist-papers-#{@paper_2.id}" do
        expect(page).to have_content("Name: #{@paper_2.name}")
        expect(page).to have_content("Pages: #{@paper_2.pages}")
      end

      within "#economist-papers-#{@paper_3.id}" do
        expect(page).to have_content("Name: #{@paper_3.name}")
        expect(page).to have_content("Pages: #{@paper_3.pages}")
      end
    end
  end
end

#
# User Story 2
#
# As a visitor
# When I visit `/comedians`
# Then I also see a list of each comedian's TV specials, including
#   * Name of the special
#   * Run Time of the special in minutes
#
# - You may find this information on IMDB.com and other related sites.
# - Your project does not need to include *every* special the comedian has ever made.
