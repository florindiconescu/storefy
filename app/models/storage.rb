class Storage < ApplicationRecord
  geocoded_by :address
  belongs_to :user
  has_many :bookings
  has_many :photos
  validates :title, :price, :sqm, :address, presence: true
  after_validation :geocode, if: :will_save_change_to_address?
end
