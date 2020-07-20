class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
	devise :database_authenticatable, :registerable,
	     :recoverable, :rememberable, :validatable

	validates :family_name, presence: true
	validates :first_name, presence: true
	validates :kana_family_name, presence: true
	validates :kana_first_name, presence: true
	validates :phone_number, presence: true
	validates :postal_code, presence: true
	validates :address, presence: true

	enum is_active: {Available: true, Invalid: false}

	def active_for_authentication?
		super && (self.is_active === "Available")
	end

end
