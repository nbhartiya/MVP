# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

event = Event.find_or_create_by_title(title: 'Pie Shake Make', people_limit: '35', description: 'Make pies with Chile Pies and Creamery', date:'2013-07-20', time:'4:00PM', cost:'35.0', length:120, blurb:'it will be funn')