class Booking < ApplicationRecord
  belongs_to :storage_space
  belongs_to :user
  has_many :reviews
end
