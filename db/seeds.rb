# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

boat = Equipment.create(name: "Boat", category: "Vehicle", available: true, cost: 500)
scuba_gear = Equipment.create(name: "Scuba Gear", category:"Gear", available: true, cost: 50)
snorkel = Equipment.create(name: "Snorkel", category: "Gear", available: false, cost: 20)
kayak = Equipment.create(name: "Kayak", category: "Vehicle", available: false, cost: 100)
canoe = Equipment.create(name: "Canoe", category: "Vehicle", available: true, cost: 200)

test_user = User.create(email: "testing@testing.com", name: "testing", password: "testing")
admin_test_user = User.create(email: "admin@admin.com", name: "admin", password: "admin", admin: true)
admin_boat_reservation = Reservation.create(user_id: 2, equipment_id: 1, date: "2019-08-31", start_time: "2000-01-01 08:00:00", end_time: "2000-01-01 23:00:00")