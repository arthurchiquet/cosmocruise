# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"

user = User.create!(email: "alexis@wagon.fr", password: "aloalo")
user.save

file = URI.open("https://cdn.spacetelescope.org/archives/images/thumb700x/heic2007a.jpg")
trip = Trip.create(title: "Galactic Adventure", description: "Embark on an unforgettable journey through the cosmos", category: "Space Exploration", location: "Orion Nebula", price_per_day: 5000, user: user)
trip.photo.attach(io: file, filename: "galactic.png", content_type: "image/jpg")
trip.save

file = URI.open("https://static.wikia.nocookie.net/for-all-mankind/images/8/85/FAM_101_63.35_Apollo11-LEM_on_Moon_closeup.png/revision/latest?cb=20220626153351")
trip = Trip.create(title: "Lunar Excursion", description: "Experience the beauty of Earth's moon up close.", category: "Lunar Tourism", location: "Moon", price_per_day: 2500, user: user)
trip.photo.attach(io: file, filename: "lunar.png", content_type: "image/jpg")
trip.save

file = URI.open("https://images.unsplash.com/photo-1628690085226-4d47d26bab46?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80")
trip = Trip.create(title: "Interstellar Voyage", description: "Travel to distant star systems and encounter alien civilizations.", category: "Interstellar Travel", location: "Andromeda Galaxy", price_per_day: 10000, user: user)
trip.photo.attach(io: file, filename: "interstellar.png", content_type: "image/jpg")
trip.save

file = URI.open("https://images.unsplash.com/photo-1630694093867-4b947d812bf0?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1315&q=80")
trip = Trip.create(title: "Martian Expedition", description: "Explore the red planet and witness its unique landscapes", category: "Planetary Exploration", location: "Mars", price_per_day: 3500, user: user)
trip.photo.attach(io: file, filename: "mars.png", content_type: "image/jpg")
trip.save

file = URI.open("https://images.unsplash.com/photo-1518573484273-eb277fe4b036?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1469&q=80")
trip = Trip.create(title: "Zero Gravity Adventure", description: "Experience weightlessness and float in space.", category: "Zero Gravity", location: "Low Earth Orbit", price_per_day: 8000, user: user)
trip.photo.attach(io: file, filename: "gravity.png", content_type: "image/jpg")
trip.save

file = URI.open("https://images.unsplash.com/photo-1630839437035-dac17da580d0?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1315&q=80")
trip = Trip.create(title: "Jupiter Discovery", description: "Get up close to the largest planet in our solar system.", category: "Gas Giant Observation", location: "Jupiter", price_per_day: 6000, user: user)
trip.photo.attach(io: file, filename: "jupiter.png", content_type: "image/jpg")
trip.save
