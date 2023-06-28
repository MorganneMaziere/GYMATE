# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Sport.destroy_all
Event.destroy_all
Booking.destroy_all
BuddiesList.destroy_all
User.destroy_all

# user
puts 'user creation'
morganne = User.create!(email: 'momo@gmail.com', password: 'morganne', first_name: "Morganne", last_name: "Maziere", profilepic: "morganne.jpeg", description: "Salut, j'adore le sport et partager des moments aves mes amis!" )

charlotte = User.create!(email: 'cha@gmail.com', password: 'charlotte', first_name: "Charlotte", last_name: "Salmona", profilepic: "charlotte.jpeg", description: "Salut, j'adore le sport et partager des moments aves mes amis!")

anouk = User.create!(email: 'noukita@gmail.com', password: 'anouk1', first_name: "Anouk", last_name: "Semerdjian", profilepic: "anouk.jpeg", description: "Salut, j'adore le sport et partager des moments aves mes amis!")
puts 'finished!'

# buddy
puts 'buddy creation'
buddyList1 = BuddiesList.create!(user: morganne, buddy: charlotte)
buddyList2 = BuddiesList.create!(user: morganne, buddy: anouk)
buddyList3 = BuddiesList.create!(user: charlotte, buddy: anouk)
# buddylist1 = morganne.BuddiesList.create!(buddy: charlotte)
# buddylist2 = morganne.BuddiesList.create!(buddy: anouk)
# buddylist3 = charlotte.BuddiesList.create!(buddy: anouk)
puts 'finished!'

# sport
puts 'sport creation'
yoga = Sport.create!(name: 'Yoga', level: 'Débutant',
  description: "Le yoga est une pratique holistique qui combine des postures physiques,
  des exercices de respiration et la méditation pour favoriser la flexibilité, la force
  et la paix intérieure.")

jump = Sport.create!(name: 'Jump', level: 'Confirmé',
  description: "Jump est un sport fitness à haute intensité qui implique différents
  mouvements explosifs, tels que des sauts, des squats et des fentes, conçu pour améliorer
  l'endurance cardiovasculaire et la force musculaire..")
puts 'finished!'

# event
puts 'event creation'
event1 = Event.create!(title: 'Yoga Morning', description: 'Cours de yoga pour débutant',
  location: 'Marseille', event_date: '12.07.2023', sport: yoga, user: morganne)

event2 = Event.create!(title: 'Yoga evening', description: 'Cours de yoga pour confirmé',
  location: 'Marseille', event_date: '12.07.2023', sport: yoga, user: morganne)

puts 'finished'

# booking
puts 'booking creation'
booking1 = Booking.create!(user: morganne, event: event1)

booking2 = Booking.create!(user: anouk, event: event2)
puts 'finished'
