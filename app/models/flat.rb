class Flat < ApplicationRecord
  belongs_to :user
  has_many :users, through: :bookings
  has_many :bookings

  alias_attribute :owner, :user
  alias_attribute :guests, :users

  mount_uploader :photo, PhotoUploader
  geocoded_by :address
  after_validation :geocode, if: :address_changed?

end
