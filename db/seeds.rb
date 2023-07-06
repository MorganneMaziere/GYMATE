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
UserSport.destroy_all
BuddiesList.destroy_all
User.destroy_all

# user
puts 'user creation'
morganne = User.create!(email: 'momo@gmail.com', password: 'morganne', first_name: "Morganne", last_name: "Maziere", profilepic: "morganne.jpg", description: "Salut, j'adore le sport et partager des moments aves mes amis!", location: "Marseille" )
charlotte = User.create!(email: 'cha@gmail.com', password: 'charlotte', first_name: "Charlotte", last_name: "Salmona", profilepic: "charlotte.jpg", description: "Salut, j'adore le sport et partager des moments aves mes amis!", location: "Marseille")
anouk = User.create!(email: 'noukita@gmail.com', password: 'anouk1', first_name: "Anouk", last_name: "Semerdjian", profilepic: "anouk.jpg", description: "Salut, j'adore le sport et partager des moments aves mes amis!", location: "Marseille")
jeanloup = User.create!(email: 'jl@gmail.com', password: 'morganne', first_name: "JeanLoup", last_name: "Perez", profilepic: "jl.jpg", description: "Salut, j'adore le sport et partager des moments aves mes amis!", location: "Marseille" )
gabriel = User.create!(email: 'gabi@gmail.com', password: 'morganne', first_name: "Gabriel", last_name: "Lauzier", profilepic: "gabi.png", description: "Salut, j'adore le sport et partager des moments aves mes amis!", location: "Marseille")
gaspard = User.create!(email: 'gaspou@gmail.com', password: 'morganne', first_name: "Gaspard", last_name: "Lachaize", profilepic: "gaspou.png", description: "Salut, j'adore le sport et partager des moments aves mes amis!", location: "Marseille")
alice = User.create!(email: 'alice@gmail.com', password: 'morganne', first_name: "Alice", last_name: "Gorius", profilepic: "alice.jpg", description: "Salut, j'adore le sport et partager des moments aves mes amis!", location: "Marseille" )
clara = User.create!(email: 'clara@gmail.com', password: 'morganne', first_name: "Clara", last_name: "Holm", profilepic: "clara.jpg", description: "Salut, j'adore le sport et partager des moments aves mes amis!", location: "Marseille")
puts 'finished!'

# buddy
puts 'buddy creation'
bd1 = BuddiesList.create!(user: morganne, buddy: charlotte)
bd8 = BuddiesList.create!(user: charlotte, buddy: morganne)
bd2 = BuddiesList.create!(user: morganne, buddy: anouk)
bd3 = BuddiesList.create!(user: morganne, buddy: jeanloup)
bd4 = BuddiesList.create!(user: morganne, buddy: gabriel)
bd5 = BuddiesList.create!(user: morganne, buddy: gaspard)
bd6 = BuddiesList.create!(user: morganne, buddy: alice)
bd7 = BuddiesList.create!(user: morganne, buddy: clara)
puts 'finished!'


# sport
puts 'sport creation'
yoga = Sport.create!(name: 'Yoga', level: 'Débutant',
  description: "Le yoga est une pratique holistique qui combine des postures physiques,
  des exercices de respiration et la méditation pour favoriser la flexibilité, la force
  et la paix intérieure.", image: 'yoga.jpg')

jump = Sport.create!(name: 'Jump', level: 'Confirmé',
  description: "Jump est un sport fitness à haute intensité qui implique différents
  mouvements explosifs, tels que des sauts, des squats et des fentes, conçu pour améliorer
  l'endurance cardiovasculaire et la force musculaire..", image: 'jump.jpg')

crossfit = Sport.create!(name: 'Crossfit', level: 'Motivé',
  description: "Le CrossFit est un sport complet qui combine des exercices fonctionnels
  variés tels que l'haltérophilie, l'athlétisme et la gymnastique, visant à améliorer
  la condition physique globale.", image: 'crossfit.jpg')

boxe = Sport.create!(name: 'Boxe', level: 'Débutant',
  description: "La boxe est un sport de combat qui met l'accent sur la technique des
  coups de poing et la défense, favorisant la condition physique et la discipline
  mentale.", image: 'boxe.jpg')

cardio = Sport.create!(name: 'Cardio', level: 'Motivé',
  description: "Le sport cardio est une activité physique axée sur l'endurance cardiovasculaire,
   visant à améliorer la santé cardiorespiratoire et à brûler des calories grâce à des exercices
    dynamiques et rythmés.", image: 'cardio.jpg')
puts 'finished!'


# user sports
puts 'users sports creation'
UserSport.create!(user: anouk, sport: yoga)
UserSport.create!(user: charlotte, sport: yoga)
UserSport.create!(user: charlotte, sport: jump)
UserSport.create!(user: morganne, sport: crossfit)
UserSport.create!(user: morganne, sport: cardio)
UserSport.create!(user: anouk, sport: cardio)
UserSport.create!(user: charlotte, sport: crossfit)
UserSport.create!(user: charlotte, sport: boxe)
UserSport.create!(user: morganne, sport: jump)
UserSport.create!(user: morganne, sport: boxe)
UserSport.create!(user: anouk, sport: jump)
UserSport.create!(user: gabriel, sport: cardio)
UserSport.create!(user: alice, sport: crossfit)
UserSport.create!(user: clara, sport: boxe)
UserSport.create!(user: gaspard, sport: jump)
UserSport.create!(user: jeanloup, sport: boxe)
UserSport.create!(user: gabriel, sport: jump)

puts 'finished!'


# event
puts 'event creation'
event1 = Event.create!(title: 'Yoga Morning', description: 'Cours de yoga pour débutant',
  location: 'Marseille', event_date: Date.new(2023, 7, 12), sport: yoga, user: morganne,
  starting_hour: Time.new(2023, 7, 12, 8, 30, 0), ending_hour: Time.new(2023, 7, 12, 10, 30, 0))

# event2 = Event.create!(title: 'Yoga evening', description: 'Cours de yoga pour confirmé',
#   location: 'Marseille', event_date: Date.new(2023, 7, 14), sport: yoga, user: morganne,
#   starting_hour: Time.new(2023, 7, 14, 18, 30, 0), ending_hour: Time.new(2023, 7, 14, 20, 30, 0))

event3 = Event.create!(title: 'Jump afternoon', description: 'Cours de jump pour motivé',
  location: 'Marseille', event_date: Date.new(2023, 7, 16), sport: jump, user: morganne,
  starting_hour: Time.new(2023, 7, 16, 16, 30, 0), ending_hour: Time.new(2023, 7, 16, 18, 30, 0))

event4 = Event.create!(title: 'Crosstraining', description: 'Cours de crossfit pour débutant',
  location: 'Marseille', event_date: Date.new(2023, 7, 18), sport: crossfit, user: charlotte,
  starting_hour: Time.new(2023, 7, 18, 10, 30, 0), ending_hour: Time.new(2023, 7, 18, 12, 30, 0))

event5 = Event.create!(title: 'Assouplissement', description: 'Cours de yoga pour confirmé',
  location: 'Marseille', event_date: Date.new(2023, 7, 20), sport: yoga, user: gabriel,
  starting_hour: Time.new(2023, 7, 20, 8, 30, 0), ending_hour: Time.new(2023, 7, 20, 10, 30, 0))

event6 = Event.create!(title: 'Body attack', description: 'Cours de boxe pour personne',
  location: 'Marseille', event_date: Date.new(2023, 7, 22), sport: boxe, user: anouk,
  starting_hour: Time.new(2023, 7, 22, 16, 30, 0), ending_hour: Time.new(2023, 7, 22, 18, 30, 0))
puts 'finished'

# booking
puts 'booking creation'
booking1 = Booking.create!(user: gabriel, event: event1)

booking2 = Booking.create!(user: anouk, event: event6)

booking3 = Booking.create!(user: charlotte, event: event3)

# booking4 = Booking.create!(user: morganne, event: event4)

booking5 = Booking.create!(user: charlotte, event: event5)

puts 'finished'

puts 'chatroom'
Chatroom.create!(buddies_list: bd1)
Chatroom.create!(buddies_list: bd8)

puts 'finished'
