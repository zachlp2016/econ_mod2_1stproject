require 'rails_helper'


RSpec.describe 'Economist show page shows profile information' do
  describe 'When I visit the the economist show page' do

    before :each do
      @johnmkeynes = Economist.create(name: "John Maynard Keynes", age: "deceased", city: "Cambridge", img_url: "https://upload.wikimedia.org/wikipedia/commons/7/75/Lord_Keynes.jpg")
      @friedrichhayek = Economist.create(name: "Friedrich Hayek", age: "deceased", city: "Vienna", img_url: "https://upload.wikimedia.org/wikipedia/commons/7/7f/Friedrich_Hayek_portrait.jpg")
    end

    it 'It shows all of the economists unique information' do

      visit economists_path

      expect(page).to have_link("John Maynard Keynes")

      click_link("John Maynard Keynes")

      expect(current_path).to eq(economist_path(@johnmkeynes))

      expect(page).to have_content("Name: #{@johnmkeynes.name}")
      expect(page).to have_content("Age: deceased")
      expect(page).to have_content("Hometown: #{@johnmkeynes.city}")
      expect(page).to have_content("Number of Papers: #{@johnmkeynes.paper_count}")

      expect(page).to_not have_content("Name: #{@friedrichhayek.name}")
    end
  end
end



# that comedian's information and TV specials.
#
# For example, comedian #4 in your database would have a page like
# `/comedians/4`
#
# - Testing should check that only this one comedian's information
#   is on the page.
