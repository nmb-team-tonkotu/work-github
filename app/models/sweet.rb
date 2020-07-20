class Sweet < ApplicationRecord
	belongs_to :genre
	has_many :order_sweets
	has_many :carts
	
  attachment :image
	validates :sell_status, inclusion: {in: [true, false]}
	validates :image, presence: true
	validates :name, presence: true
	validates :explanation, presence: true
	validates :non_taxed_price, presence: true
  def price_with_tax
    (non_taxed_price * 1.10 ).round
  end
end
