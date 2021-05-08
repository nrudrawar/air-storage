class StorageSpace < ApplicationRecord
  validates :name, :address, :city, :post_code, :country, :base_price, presence: true

  has_many_attached :photos
  has_many :bookings
  has_many :reviews, through: :bookings
end
