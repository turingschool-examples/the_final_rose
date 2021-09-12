# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
bachelorette = Bachelorette.create!(name: "Sarah", season_number: 5, season_description: "Great season")
contestant = bachelorette.contestants.create!(name: "Tony", age: 25, hometown: "Denver")
outing_1 = contestant.outings.create!(name: "Boardwalk", location: "Venice Beach", date: "02/12/2021")
