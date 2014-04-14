require 'spec_helper'

feature 'user can record car', %q{
  As a car salesperson
  I want to record a newly acquired car
  So that I can list it in my lot
  } do
    
    # I must specify the color, year, and mileage of the car.
    # Only years from 1980 and above can be specified.
    # I can optionally specify a description of the car.
    # If I enter all of the required information in the required formats, the car is recorded.
    # If I do not specify all of the required information in the required formats, the car is not recorded and I am presented with errors.
    # Upon successfully creating a car, I am redirected so that I can create another car.

  context 'with valid attributes' do
   
    it 'registers a car' do 
      visit '/cars/new'

      fill_in 'Color', with: 'blue'
      fill_in 'Year', with: "1999"
      fill_in 'Mileage', with: '120000'
    
      click_on 'Create Car'

      expect(Car.count).to eq(1)
      expect(current_path).to eq new_car_path
    end

    it 'registers a car with optional description' do 
       visit '/cars/new'

      fill_in 'Color', with: 'blue'
      fill_in 'Year', with: "1999"
      fill_in 'Mileage', with: '120000'
      fill_in 'Description', with: 'good car'

      click_on 'Create Car'

      expect(Car.count).to eq(1)
      expect(current_path).to eq new_car_path
    end

  end

  context 'with invalid attributes' do
    it 'shows error if required fields are missing' do
      visit '/cars/new'
      click_on 'Create Car'
 
      expect(page).to_not have_content("Car Added to Listing")
      expect(page).to have_content("can't be blank")
      expect(page).to have_content("can't be blank")
      expect(page).to have_content("can't be blank")
    end

    it 'shows error if year is less than 1980' do 
      visit '/cars/new'

      fill_in 'Color', with: 'blue'
      fill_in 'Year', with: "1974"
      fill_in 'Mileage', with: '120000'
    
      click_on 'Create Car'

      expect(page).to have_content("must be greater than or equal to 1980")
    end
  end
end
