# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Bachelorette.delete_all
Contestant.delete_all

@bachelorette = Bachelorette.create(name: 'Gwheniphyr Ruby', season_number: 80, season_description: 'the one at the haunted trailor park')

@contestant1 = Contestant.create(name: 'Brad Guy', age: 29, hometown: 'Los Angeles', bachelorette_id: @bachelorette)
@contestant2 = Contestant.create(name: 'Tyler Dude', age: 31, hometown: 'New York', bachelorette_id: @bachelorette)
@contestant3 = Contestant.create(name: 'Steve Bro', age: 34, hometown: 'New Jersey', bachelorette_id: @bachelorette)
