# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Bachelorette.delete_all
Contestant.delete_all
Outing.delete_all
ContestantOuting.delete_all

@bachelorette = Bachelorette.create(name: 'Gwheniphyr Ruby', season_number: 80, season_description: 'the one at the haunted trailor park')
@contestant1 = @bachelorette.contestants.create(name: 'Brad Guy', age: 29, hometown: 'Los Angeles')
@contestant2 = @bachelorette.contestants.create(name: 'Tyler Dude', age: 31, hometown: 'New York')
@contestant3 = @bachelorette.contestants.create(name: 'Steve Bro', age: 34, hometown: 'New Jersey')
@outing1 = Outing.create(name: 'Face Planting', location: 'Mountain Peaks', date: '9/11/2032' )
@outing2 = Outing.create(name: 'Truth or Dare', location: 'Troll Bridge', date: '9/13/2032' )
@outing3 = Outing.create(name: 'Eating Contest', location: 'Cannibal Castle', date: '9/15/2032' )
@outing_decoy = Outing.create(name: 'Decoy Outing', location: 'No place', date: 'No day' )

ContestantOuting.create(contestant_id: @contestant1.id, outing_id: @outing1.id)
ContestantOuting.create(contestant_id: @contestant2.id, outing_id: @outing1.id)

ContestantOuting.create(contestant_id: @contestant2.id, outing_id: @outing2.id)
ContestantOuting.create(contestant_id: @contestant3.id, outing_id: @outing2.id)

ContestantOuting.create(contestant_id: @contestant3.id, outing_id: @outing3.id)
ContestantOuting.create(contestant_id: @contestant1.id, outing_id: @outing3.id)
