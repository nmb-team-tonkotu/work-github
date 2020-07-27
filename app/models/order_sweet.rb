class OrderSweet < ApplicationRecord
	belongs_to :sweet
	belongs_to :order

	enum create_status: {"着手不可" => 0, "製作待ち" => 1, "製作中" => 2, "製作完了" => 3 }

	def order_sum
		self.price * self.count
	end
end
