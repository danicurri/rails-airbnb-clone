class Flat < ApplicationRecord
  belongs_to :user
  has_many :users, through: :bookings
  has_many :bookings

  alias_attribute :owner, :user
  alias_attribute :guests, :users
end