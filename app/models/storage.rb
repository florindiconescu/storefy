class Storage < ApplicationRecord
  belongs_to :user
  has_many :bookings
  has_many :photos
  validates :title, :price, :sqm, :address, presence: true
end
