# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

BuddiesList.destroy_all
User.destroy_all

puts "user creation"
morganne = User.create!(email:"momo@gmail.com", password:"morganne")

charlotte = User.create!(email:"cha@gmail.com", password:"charlotte")

anouk = User.create!(email:"noukita@gmail.com", password:"anouk1")

puts "finished!"

# buddyList1 = BuddiesList.create!(user: morganne, buddy: charlotte)

# buddyList2 = BuddiesList.create!(user: morganne, buddy: anouk)

# buddyList3 = BuddiesList.create!(user: charlotte, buddy: anouk)

puts "buddy creation"
buddylist1 = morganne.BuddiesList.create!(buddy: charlotte)

buddylist2 = morganne.BuddiesList.create!(buddy: anouk)

buddylist3 = charlotte.BuddiesList.create!(buddy: anouk)
puts "finished!"
