require 'spec_helper'

feature 'user can record manufacturer', %q{
  As a car salesperson
  I want to record a car listing's manufacturer
  So that I can keep track of its manufacturer
  } do
    
    # I must specify a manufacturer name and country.
    # If I do not specify the required information, 
    # I am presented with errors.
    # If I specify the required information, 
    # the manufacturer is recorded and
    # I am redirected to enter another new manufacturer.
 

  context 'with valid attributes' do
   
    it 'registers a manufacturer' do 
      visit '/manufacturers/new'

      fill_in 'Name', with: 'BMW'
      select "Germany", from: "Country", :match => :first
      click_on 'Create Manufacturer'

      expect(Manufacturer.count).to eq(1)
      expect(current_path).to eq new_manufacturer_path
    end
  end

  context 'with invalid attributes' do
    it 'shows error if required fields are missing' do
      visit '/manufacturers/new'
      click_on 'Create Manufacturer'
 
      expect(page).to_not have_content("Manufacturer Added to Listing")
      expect(page).to have_content("can't be blank")
      expect(page).to have_content("can't be blank")
    end
  end
end
