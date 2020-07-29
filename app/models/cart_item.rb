class CartItem < ApplicationRecord
	belongs_to :customer
	belongs_to :sweet

	validates :sweet_count, presence: true
end
