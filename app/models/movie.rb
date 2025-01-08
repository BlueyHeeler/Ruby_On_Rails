class Movie < ApplicationRecord
  belongs_to :user
  has_one_attached :poster_image # O nome `poster_image` pode ser qualquer nome que você escolher

  validates :name, presence: true
  validates :release_date, presence: true
  validates :rating, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }
  validates :description, presence: true, length: { maximum: 500 }
end
