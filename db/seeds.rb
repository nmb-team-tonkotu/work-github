# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)









Customer.create!(
	family_name: "大阪",
	first_name: "太郎",
	kana_family_name: "オオサカ",
	kana_first_name: "タロウ",
	postal_code: "111111",
	address: "大阪府大阪市",
	phone_number: "22233334444",
	email: "osaka@gmail.com",
	is_active: "true",
	password: "000000"
)