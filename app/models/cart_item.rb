class CartItem < ApplicationRecord
	belongs_to :customer
	belongs_to :sweet

	with_options presence: true do
		validates :customer_id
		validates :sweet_id
		validates :sweet_count
	end

	validates :sweet_count, numericality:
		{only_integer: true, greater_than_or_equal_to: 1}

end
