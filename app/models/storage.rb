class Storage < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :photos
end
