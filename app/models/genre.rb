class Genre < ApplicationRecord
  has_many :sweets
  validates :sweet_genre, presence: true
end
