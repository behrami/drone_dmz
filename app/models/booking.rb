class Booking < ApplicationRecord
  # relations
  belongs_to :pilot
  belongs_to :patron
end
