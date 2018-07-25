class Booking < ApplicationRecord
  # validations
  validates :patron_id, presence: true
  validates :pilot_id, presence: true
  validates :when, presence: true

  # relations
  belongs_to :pilot
  belongs_to :patron
end
