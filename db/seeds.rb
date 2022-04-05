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