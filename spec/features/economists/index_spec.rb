require 'rails_helper'


RSpec.describe 'When I visit the index page', type: :feature do
  context 'as a visitor'

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

  it 'sees a list of economists with the following information' do
    visit '/economists'

    expect(current_path).to eq(economists_path)

    within "#economist-#{@johnmkeynes.id}" do
      # expect(page).to have_xpath("//img[@src = '#{@johnmkeynes.img_url}' and @alt='economist photo']")
      expect(page).to have_content("Name: #{@johnmkeynes.name}")
      expect(page).to have_content("Age: deceased")
      expect(page).to have_content("Hometown: #{@johnmkeynes.city}")
      expect(page).to have_content("Number of Papers: #{@johnmkeynes.paper_count}")
    end

    within "#economist-#{@friedrichhayek.id}" do
      # expect(page).to have_xpath("//img[@src = '#{@johnmkeynes.img_url}' and @alt='economist photo']")
      expect(page).to have_content("Name: #{@friedrichhayek.name}")
      expect(page).to have_content("Age: deceased")
      expect(page).to have_content("Hometown: #{@friedrichhayek.city}")
      expect(page).to have_content("Number of Papers: #{@friedrichhayek.paper_count}")
    end


  end

  it 'sees a statistics area at the top of the page' do
    visit economists_path

    expect(page).to have_content("Statistics:")

    within ".statistics-area" do
      expect(page).to have_content("Average age: 77")
      expect(page).to have_content("Total Number of Papers in database: 3")
      expect(page).to have_content("Average Number of Pages for Papers in database: 411")
    end


    within ".hometowns" do
      expect(page).to have_content("Hometowns: Vienna Trier Cambridge Augusta San Francisco New York City")
    end
  end
end

# As a user, when I visit `/comedians`,
# I see all previous information
# And, in the statistics area:
# - A total count of specials for all comedians on the page
# - the average run length of every TV special on the page
