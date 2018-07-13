class RecuitorProfile < ApplicationRecord
  belongs_to :recuitor

  mount_uploader :photo, PhotoUploader
end
