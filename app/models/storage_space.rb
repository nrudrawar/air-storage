class StorageSpace < ApplicationRecord
  validates :name, :address, :base_price, presence: true

  has_many_attached :photos
  has_many :bookings
  has_many :reviews, through: :bookings

  belongs_to :user

  geocoded_by :address
  after_validation :geocode, if: :will_save_change_to_address?

  include PgSearch::Model
  pg_search_scope :search_name_address_description,
  against: [:name, :address, :description],
  using: {
    tsearch: {prefix: true}
  }
end
