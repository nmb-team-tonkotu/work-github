class Order < ApplicationRecord
	belongs_to :customer
	has_many :order_sweets

	has_many :sweets

	enum status: {"入金待ち": 0,"入金確認": 1 ,"製作中": 2,"発送準備中": 3, "発送済み": 4}
	enum payment_method: [:クレジット, :銀行支払]

end
