class Pilot < ApplicationRecord
  # validations
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: true, presence: true
  validates :phone, uniqueness: true, format: { with: /\A\d+\z/, message: "Please enter numbers only" }, presence: true
  validates :driver_license, presence: true
  validates :drone_number, presence: true
  validates :cost, :numericality => { :greater_than_or_equal_to => 1 }
  validates :available_days, presence: true
  validates :country, presence: true
  validates :state, presence: true
  validates :city, presence: true
  validates :street, presence: true
  validates :postal_code, presence: true

  # relations
  has_many :bookings
  has_many :patrons, through: :bookings
end
