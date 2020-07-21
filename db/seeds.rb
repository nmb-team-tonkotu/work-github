# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
    email: "abc@abc.com",
    password:  "000000",
    password_confirmation: "000000"
)

10.times do |n|
    Customer.create!(
        family_name: "山田",
        first_name: "太郎#{n+1}",
        kana_family_name: "ヤマダ",
        kana_first_name: "タロウ#{n+1}",
        phone_number: "1231234123#{n+1}",
        email: "test#{n+1}@test.com",
        password: "000000",
        postal_code: "1231234",
        address: "大阪"
    )
  end

  Order.create!(
    customer_id: "1",
    customer_name: "山田太郎",
    postal_code: "12312341231",
    address: "大阪",
    postage: "1231234",
    payment_method: "クレジット",
    billing_amount: "1000"
  )