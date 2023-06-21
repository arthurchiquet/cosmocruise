# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"

Trip.destroy_all
User.destroy_all

user = User.create!(email: "alexis@wagon.fr", password: "aloalo")
user.save

file = URI.open("https://cdn.spacetelescope.org/archives/images/thumb700x/heic2007a.jpg")
trip = Trip.create(title: "Galactic Adventure", description: "Embark on an unforgettable journey through the cosmos", category: "Alien World Exploration", location: "Orion Nebula", price_per_day: 5000, departure: "Kennedy Space Center", nb_travelers_max: 5, nb_days_min: 7, vessel: "Alpha-7X Series", user: user)
trip.photo.attach(io: file, filename: "galactic.png", content_type: "image/jpg")
trip.save

file = URI.open("https://static.wikia.nocookie.net/for-all-mankind/images/8/85/FAM_101_63.35_Apollo11-LEM_on_Moon_closeup.png/revision/latest?cb=20220626153351")
trip = Trip.create(title: "Lunar Excursion", description: "Experience the beauty of Earth's moon up close.", category: "Alien World Exploration", location: "Moon", price_per_day: 2500, departure: "Baikonur Cosmodrome", nb_travelers_max: 14, nb_days_min: 12, vessel: "Project Stellarius", user: user)
trip.photo.attach(io: file, filename: "lunar.png", content_type: "image/jpg")
trip.save

file = URI.open("https://images.unsplash.com/photo-1628690085226-4d47d26bab46?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1470&q=80")
trip = Trip.create(title: "Interstellar Voyage", description: "Travel to distant star systems and encounter alien civilizations.", category: "Luxury Space Cruises", location: "Andromeda Galaxy", price_per_day: 10000, departure: "Kennedy Space Center", nb_travelers_max: 8, nb_days_min: 10, vessel: "", user: user)
trip.photo.attach(io: file, filename: "interstellar.png", content_type: "image/jpg")
trip.save

file = URI.open("https://images.unsplash.com/photo-1630694093867-4b947d812bf0?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1315&q=80")
trip = Trip.create(title: "Martian Expedition", description: "Explore the red planet and witness its unique landscapes", category: "Intergalactic Races", location: "Mars", price_per_day: 3500, departure: "Satish Dhawan Space Centre", nb_travelers_max: 15, nb_days_min: 12, vessel: "Alpha-7X Series", user: user)
trip.photo.attach(io: file, filename: "mars.png", content_type: "image/jpg")
trip.save

file = URI.open("https://images.unsplash.com/photo-1518573484273-eb277fe4b036?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1469&q=80")
trip = Trip.create(title: "Zero Gravity Adventure", description: "Experience weightlessness and float in space.", category: "Space Colonization", location: "Low Earth Orbit", price_per_day: 8000, departure: "Baikonur Cosmodrome", nb_travelers_max: 30, nb_days_min: 1, vessel: "Orionis-XI Type", user: user)
trip.photo.attach(io: file, filename: "gravity.png", content_type: "image/jpg")
trip.save

file = URI.open("https://images.unsplash.com/photo-1630839437035-dac17da580d0?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1315&q=80")
trip = Trip.create(title: "Jupiter Discovery", description: "Get up close to the largest planet in our solar system.", category: "Intergalactic Races", location: "Jupiter", price_per_day: 6000, departure: "Jiuquan Satellite Launch Center", nb_travelers_max: 11, nb_days_min: 4, vessel: "Nebula-500 Class", user: user)
trip.photo.attach(io: file, filename: "jupiter.png", content_type: "image/jpg")
trip.save

file = URI.open("https://images.unsplash.com/photo-1637984135921-301a7d39e3b7?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1315&q=80")
trip = Trip.create(title: "Saturn Rings Expedition", description: "Witness the breathtaking beauty of Saturn's iconic rings.", category: "Intergalactic Races", location: "Saturn", price_per_day: 5500, departure: "Kennedy Space Center", nb_travelers_max: 140, nb_days_min: 7, vessel: "Nebula-500 Class", user: user)
trip.photo.attach(io: file, filename: "saturn.png", content_type: "image/jpg")
trip.save

file = URI.open("https://images.unsplash.com/photo-1545156521-77bd85671d30?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=880&q=80")
trip = Trip.create(title: "Exoplanet Exploration", description: "Discover distant planets orbiting other stars.", category: "Space Colonization", location: "Exoplanet", price_per_day: 7000, departure: "Kourou Space Centre", nb_travelers_max: 100, nb_days_min: 20, vessel: "Pulsar-IX Model", user: user)
trip.photo.attach(io: file, filename: "exoplanet.png", content_type: "image/jpg")
trip.save

file = URI.open("https://images.unsplash.com/photo-1506703244717-0f4fb867779d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=880&q=80")
trip = Trip.create(title: "Asteroid Mining Adventure", description: "Join a mining expedition to extract valuable resources from asteroids.", category: "Luxury Space Cruises", location: "Asteroid Belt", price_per_day: 4500, departure: "Kourou Space Centre", nb_travelers_max: 20, nb_days_min: 4, vessel: "Project Stellarius", user: user)
trip.photo.attach(io: file, filename: "asteroid.png", content_type: "image/jpg")
trip.save

file = URI.open("https://images.unsplash.com/photo-1614313913007-2b4ae8ce32d6?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1074&q=80")
trip = Trip.create(title: "Neptune Deep Dive", description: "Explore the mysterious depths of Neptune's atmosphere and witness its vibrant blue color.", category: "Intergalactic Races", location: "Neptune", price_per_day: 7000, departure: "Satish Dhawan Space Centre", nb_travelers_max: 50, nb_days_min: 14, vessel: "Vortex-3000 Class", user: user)
trip.photo.attach(io: file, filename: "neptune.png", content_type: "image/jpg")
trip.save

file = URI.open("https://images.unsplash.com/photo-1597449031666-21da12583121?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1170&q=80")
trip = Trip.create(title: "Black Hole Expedition", description: "Witness the extreme gravitational forces and mind-bending phenomena near a supermassive black hole.", category: "Temporal Space Travel", location: "Black Hole", price_per_day: 10000, departure: "Kourou Space Centre", nb_travelers_max: 4, nb_days_min: 700, vessel: "Quasar-X Series", user: user)
trip.photo.attach(io: file, filename: "black_hole.png", content_type: "image/jpg")
trip.save

file = URI.open("https://images.unsplash.com/photo-1506272517965-ec6133efee7a?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=1332&q=80")
trip = Trip.create(title: "Space Station Expedition", description: "Live and work on a space station orbiting Earth.", category: "Alien World Exploration", location: "International Space Station", price_per_day: 9000, departure: "Jiuquan Satellite Launch Center", nb_travelers_max: 5, nb_days_min: 7, vessel: "Vortex-3000 Class", user: user)
trip.photo.attach(io: file, filename: "space_station.png", content_type: "image/jpg")
trip.save
