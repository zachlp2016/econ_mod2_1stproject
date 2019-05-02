require 'rails_helper'
require 'pry'


RSpec.describe 'New Economist Form' do
  describe 'When I go to the new economist link' do
    describe 'Then I see a form to create a new economist' do

      it 'Has a form to create a new economist' do
        visit '/economists/new'

        within 'new-economist-form'


          fill_in 'economist[name]', with: 'New Economist'
          fill_in 'economist[age]', with: 70
          fill_in 'economist[city]', with: 'New City'


          click_on('Create')

          new_economist = Economist.last

          expect(current_path).to eq(economists_path)
          expect(new_economist.name).to have_content('New Economist')
          expect(new_economist.age).to have_content(70)
          expect(new_economist.city).to have_content('New City')

      end
    end
  end
end



# As a visitor
# When I visit `/comedians/new`
# Then I see a form to input a new comedian into the database
# Including fields for their name, age and city.
# When the form is successfully submitted and saved,
# Then I am redirected to `/comedians`
# And I see the new comedian's data on the page.
