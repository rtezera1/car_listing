FactoryGirl.define do

  factory :car do
    color 'blue'
    year '1999'
    mileage '120000'
  end
  
  factory :manufacturer do
    name 'BMW'
    country 'Germany'
  end
end
