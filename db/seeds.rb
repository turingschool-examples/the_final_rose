# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

hannah = Bachelorette.create!(name: "Hannah Brown", season_number: 17)
tyler = hannah.contestants.create!(name: "Tyler Bigmouth", age: 29, hometown: "Somewhere in Ohio")
steve = hannah.contestants.create!(name: "Steve Jeevee", age: 21, hometown: "TEXAS")
