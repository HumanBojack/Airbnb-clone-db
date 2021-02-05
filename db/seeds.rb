# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

City.all.destroy_all
User.all.destroy_all

20.times do
	User.create(email: Faker::Internet.email, phone: "06#{rand(00000000..99999999)}" , description: Faker::Lorem.characters(number: 50))
end
10.times do
	City.create(name: Faker::Address.city, zip_code: /\A(([0-8][0-9])|(9[0-5])|(2[ab]))[0-9]{3}\z/.random_example)
end
50.times do 
	h = House.create(avaliable_beds: rand(1..8), price: rand(1..95), description: Faker::Lorem.characters(number: 140), welcome_message: Faker::Lorem.sentence(word_count: 5, supplemental: true, random_words_to_add: 4), admin: User.all.sample, city: City.all.sample, has_wifi: [true, false].sample)
	5.times do 
		date = Faker::Date.between(from: 2.years.ago, to: Date.today)
		Reservation.create(start_date: date, end_date:date + rand(1..12).days, house: h, guest: User.all.sample)
	end
	5.times do 
		date = Faker::Date.between(from: Date.today, to: 2.years.from_now)
		Reservation.create(start_date: date, end_date:date + rand(1..12).days, house: h, guest: User.all.sample)
	end
end