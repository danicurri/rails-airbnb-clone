class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  after_create :link_profile

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :flats, through: :bookings
  has_many :bookings #user as customer can have many bookings
  has_many :flats # user as owner onws many flats
  has_one  :profile

  private

  def link_profile 
  	self.profile = Profile.create
  end
end
