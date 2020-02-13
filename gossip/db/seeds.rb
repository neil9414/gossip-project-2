# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Seed en cours..."

print "Users ... "
User.destroy_all
2.times do		
  last_name_faker = Faker::Name.last_name
  yop_email = last_name_faker + "@" + "yopmail.com"
  User.create(
    first_name: Faker::Name.first_name, 
    last_name: last_name_faker, 
    description: Faker::Quote.famous_last_words*20, 
    email: yop_email,
    password: "aaaaaa")
end
print "Ok"
puts

print "Events ... "
Event.destroy_all
10.times do		
  Event.create(
    start_date: Faker::Date.forward(days: 40),
    duration: (5*rand(1..20)),
    title: Faker::Quote.famous_last_words,
    description: Faker::ChuckNorris.fact*2,
    price: rand(1..1000),
    admin: User.all.sample,
    location: Faker::Address.city
  )
end
print "Ok"
puts 

print "Attendances ... "
Attendance.destroy_all
20.times do		
  Attendance.create(
    user: User.all.sample,
    event: Event.all.sample,
    stripe_customer_id: "st_id"
  )
end
print "Ok"
puts 

puts "Seed : effectué !"