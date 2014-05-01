require 'spec_helper'

feature 'user can record manufacturer', %q{
  As a car salesperson
  I want to record a car listing's manufacturer
  So that I can keep track of its manufacturer
  } do
    
  # When recording a car listing, 
  # I want to optionally associate it with its manufacturer.
  # If I delete a manufacturer, the manufacturer and
  # its primary key should no longer be associated with any car listings.

  context 'associating a car with a manufacturer' do
    before(:each) do
      @manufacturer = FactoryGirl.create(:manufacturer)
    end

    it 'associates a car with a manufacturer' do 
      visit '/cars/new'

      expect(page).to have_content @manufacturer.name
    end
  end
end


