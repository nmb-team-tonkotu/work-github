class Order < ApplicationRecord
	belongs_to :customer
	has_many :order_sweets
	has_many :sweets

	enum status: {"入金待ち": 0,"入金確認": 1 ,"製作中": 2,"発送準備中": 3, "発送済み": 4}

	enum payment_method: {"クレジットカード" =>0, "銀行振込" =>1}

	with_options presence: true do
		validates :postal_code
		validates :address
		validates :address_name
	end
end
