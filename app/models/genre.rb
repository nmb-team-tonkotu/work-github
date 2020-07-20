class Genre < ApplicationRecord
  belongs_to :sweet
  validates :sweet_genre, presence: true
end
