class Photo < ApplicationRecord
  belongs_to :storage
  mount_uploader :data, PhotoUploader
end
