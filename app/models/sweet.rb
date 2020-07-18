class Sweet < ApplicationRecord
    has_many :genres, dependent: :destroy
    attachment :image
	validates :sell_status, inclusion: {in: [true, false]}
end
