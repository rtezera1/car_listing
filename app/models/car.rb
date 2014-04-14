class Car < ActiveRecord::Base
  validates :color, presence: true, format: { with: /\A[a-zA-Z]+\z/ }
  validates :year, presence: true, length: { is: 4 }, 
                numericality: { only_integer: true, 
                greater_than_or_equal_to: 1980 }
  validates :mileage, presence: true, numericality: { only_integer: true }

  belongs_to :manufacturer
end
