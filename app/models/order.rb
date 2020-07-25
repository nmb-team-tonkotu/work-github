class Order < ApplicationRecord
	belongs_to :customer
	has_many :order_sweets

	enum payment_method: { "クレジットカード" =>0, "銀行振込" =>1}
	enum status: { "入金待ち" =>0, "入金確認" =>1, "製作中" =>2, "発送準備中" =>3, "発送済み" =>4}

	with_options presence: true do
		validates :customer_id
		validates :customer_name
		validates :postal_code
		validates :address
		validates :postage
		validates :payment_method
		validates :billing_amount
		validates :address_name
	end

	validates :billing_amount, numericality:
		{only_integer: true, greater_than_or_equal_to: 801}

end
