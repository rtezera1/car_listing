class Manufacturer < ActiveRecord::Base
  validates :name, presence: true
  validates :country, presence: true, format: { with: /\A[a-zA-Z]+\z/ }

  attr_accessor :country_code

  has_many :cars
end
