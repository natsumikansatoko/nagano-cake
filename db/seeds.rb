# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Admin.create!(
    email: "admin@ad.com",
    password: "012345"
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
      telephone_number: "09012345678",
      is_active: true
    )
end

Customer.create!(
  id: 21,
  last_name: "佐藤",
  first_name: "菜々子",
  last_name_kana: "サトウ",
  first_name_kana: "ナナコ",
  email: "test@test.com",
  password: "012345",
  postal_code: "0000000",
  address: "東京都千代田区二番町",
  telephone_number: "0900001111",
  is_active: true
  )

  Address.create!(
    customer_id: 21,
    postal_code: "2440812",
    address: "神奈川県横浜市戸塚区柏尾町3-9-10",
    name: "梅木匠"
  )

  Address.create!(
    customer_id: 21,
    postal_code: "4001114",
    address: "山梨県甲斐市打返4-15-19",
    name: "小沢時男"
  )

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
    image: open("app/assets/images/strawberry_cake.jpeg")
  )

  Item.create!(
    genre_id: 3,
    name: "焼き菓子詰め合わせ",
    introduction: "色々な焼き菓子の詰め合わせセットです。",
    price: 1500,
    is_active: [['販売中', true], ['販売停止', false]],
    image: open("app/assets/images/yakigashi.jpeg")
  )

  Item.create!(
    genre_id: 2,
    name: "濃厚カスタードプリン",
    introduction: "濃厚な卵を使用したプリンです。",
    price: 500,
    is_active: [['販売中', true], ['販売停止', false]],
    image: open("app/assets/images/purin.jpeg")
  )

  Item.create!(
    genre_id: 1,
    name: "チョコレートケーキ（ホール）",
    introduction: "濃厚なチョコレートケーキです。",
    price: 2500,
    is_active: [['販売中', true], ['販売停止', false]],
    image: open("app/assets/images/choco.jpeg")
  )

  Item.create!(
    genre_id: 4,
    name: "花束キャンディ",
    introduction: "花束の形をしたキャンディです。",
    price: 800,
    is_active: [['販売中', true], ['販売停止', false]],
    image: open("app/assets/images/ame.jpeg")
  )


  21.times do |n|
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

  21.times do |n|
    OrderItem.create!(
      item_id: n + 1,
      order_id: n + 1,
      ordered_price: "#{1000 + (n * 1000)}",
      item_count: n + 3,
      making_status: "着手不可"
    )
  end