class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :flats, through: :bookings
  has_many :bookings #user as customer can have many bookings
  has_many :flats # user as owner onws many flats
end
