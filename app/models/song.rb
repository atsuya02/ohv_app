class Song < ApplicationRecord
  scope :recording_order, -> { order(track_number: :asc) }
  validates :name, presence: true
  validates :track_number, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 1 }
  validates :cd_id, presence: true
end
