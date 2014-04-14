require 'spec_helper'

describe Manufacturer do
   describe "Validation Tests" do
      it { should have_valid(:name).when("BMW") }
      it { should_not have_valid(:name).when(nil, "") }

      it { should have_valid(:country).when("Germany") }
      it { should_not have_valid(:country).when(nil, "", "191") }
  end

  describe 'validation associations' do 
    it { should have_many :cars }
  end
  pending "add some examples to (or delete) #{__FILE__}"
end
