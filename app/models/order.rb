class Order < ApplicationRecord
	belongs_to :customer
	has_many :order_sweets
	has_many :sweets

	enum status: [:入金待ち, :入金確認, :製作中, :発送準備中, :発送済み]
	enum payment_method: [:クレジット, :銀行支払]


end
