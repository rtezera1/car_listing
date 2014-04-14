require 'spec_helper'

describe Car do
  describe "Validation Tests" do
      it { should have_valid(:color).when("blue") }
      it { should_not have_valid(:color).when(nil, "") }

      it { should have_valid(:year).when("1988") }
      it { should_not have_valid(:year).when(nil, "", "191", "1945", "smith") }

      it { should have_valid(:mileage).when('120000') }
      it {should_not have_valid(:mileage).when(nil, '', 'dskfjskdf') }
  end

  describe 'validation associations' do 
    it { should belong_to :manufacturer }
  end
  pending "add some examples to (or delete) #{__FILE__}"
end
