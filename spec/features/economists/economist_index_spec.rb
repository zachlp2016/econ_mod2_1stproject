require 'rails_helper'


RSpec.describe 'When I visit the index page', type: :feature do
  context 'as a visitor'

  before :each do
    @johnmkeynes = Economist.create(name: "John Maynard Keynes", age: "deceased", city: "Cambridge")
    @friedrichhayek = Economist.create(name: "Friedrich Hayek", age: "deceased", city: "Vienna")

  end

  it 'sees a list of economists with the following information' do
    visit '/economists'

    within "#economist-#{@johnmkeynes.id}" do
      expect(page).to have_content("Name: #{@johnmkeynes.name}")
      expect(page).to have_content("Age: #{@johnmkeynes.age}")
      expect(page).to have_content("Hometown: #{@johnmkeynes.city}")
    end

    within "#economist-#{@friedrichhayek.id}" do
      expect(page).to have_content("Name: #{@friedrichhayek.name}")
      expect(page).to have_content("Age: #{@friedrichhayek.age}")
      expect(page).to have_content("Hometown: #{@friedrichhayek.city}")
    end
  end
end
