# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
    email: "admin@admin.com",
    password: "123456"
  )

20.times do |n|
   Customer.create!(
      last_name: Gimei.unique.last.kanji,
      first_name: Gimei.unique.first.kanji,
      last_name_kana: Gimei.unique.last.katakana,
      first_name_kana: Gimei.unique.first.katakana,
      email: Faker::Internet.unique.email,
      password: "123456",
      postal_code: "123456",
      address: Gimei.unique.address.kanji,
      telephone_number: "09012345678"
    )
end

Genre.create!(
     name: "ケーキ",
  )

  Genre.create!(
     name: "プリン",
  )

  Genre.create!(
     name: "焼き菓子",
  )

  Genre.create!(
     name: "キャンディ",
  )

  Item.create!(
    genre_id: 1,
    name: "いちごのショートケーキ（ホール）",
    introduction: "栃⽊県産のとちおとめを贅沢に使⽤しています。",
    price: 2500,
    is_active: [['販売中', true], ['販売停止', false]],
  )
  
  15.times do |n|
    Order.create!(
      customer_id: n + 1,
      delivery_postal_code: "123456#{n + 1}",
      delivery_address: "東京都千代田区二番町1-1 #{n + 1}",
      delivery_name: "test#{n + 1}",
      shipping_fee: "800",
      amount_billed: "#{1000 + (n * 1000) +800}",
      payment_method: "クレジットカード",
      order_status: "入金待ち"
    )
  end

  15.times do |n|
    OrderItem.create!(
      item_id: n + 1,
      order_id: n + 1,
      ordered_price: "#{1000 + (n * 1000)}",
      item_count: n + 3,
      making_status: "着手不可"
    )
  end