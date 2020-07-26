class OrderSweet < ApplicationRecord
	belongs_to :sweet
	belongs_to :order

	with_options presence: true do
		validates :count
		validates :price
		validates :sweet_id
	end
end
