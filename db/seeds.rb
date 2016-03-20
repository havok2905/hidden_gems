# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

tags = Tag.create([
  { name: 'coffee' }
])

places = Place.create([
  {
    name: 'Coffeehaus',
    description: 'small, casual, and simple coffee shop',
    lat: 28.6585257,
    lon: -81.182116,
    street: '1016 Lockwood Blvd',
    city: 'Oviedo',
    state: 'FL',
    zip: '32765',
    tags: [
      tags[0]
    ]
  }
])
