class OrderSweet < ApplicationRecord
	belongs_to :sweet
	belongs_to :order

	enum create_status: [:着手不可, :製作待ち, :製作中, :製作完了]

	def order_sum
			self.price * self.count
	end
end