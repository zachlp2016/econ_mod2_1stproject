require 'rails_helper'


RSpec.describe 'When I visit the index page', type: :feature do
  context 'as a visitor'

  before :each do
    @johnmkeynes = Economist.create(name: "John Maynard Keynes", age: "deceased", city: "Cambridge", img_url: "https://upload.wikimedia.org/wikipedia/commons/7/75/Lord_Keynes.jpg")
    @friedrichhayek = Economist.create(name: "Friedrich Hayek", age: "deceased", city: "Vienna", img_url: "https://upload.wikimedia.org/wikipedia/commons/7/7f/Friedrich_Hayek_portrait.jpg")
    @karlmarx = Economist.create(name: "Karl Marx", age: "deceased", city: "Trier", img_url: "https://upload.wikimedia.org/wikipedia/commons/thumb/d/d4/Karl_Marx_001.jpg/1024px-Karl_Marx_001.jpg")

  end

  it 'sees a list of economists with the following information' do
    visit '/economists'

    within "#economist-#{@johnmkeynes.id}" do
      # expect(page).to have_xpath("//img[@src = '#{@johnmkeynes.img_url}' and @alt='economist photo']")
      expect(page).to have_content("Name: #{@johnmkeynes.name}")
      expect(page).to have_content("Age: #{@johnmkeynes.age}")
      expect(page).to have_content("Hometown: #{@johnmkeynes.city}")

    end

    within "#economist-#{@friedrichhayek.id}" do
      # expect(page).to have_xpath("//img[@src = '#{@johnmkeynes.img_url}' and @alt='economist photo']")
      expect(page).to have_content("Name: #{@friedrichhayek.name}")
      expect(page).to have_content("Age: #{@friedrichhayek.age}")
      expect(page).to have_content("Hometown: #{@friedrichhayek.city}")
    end
  end
end
