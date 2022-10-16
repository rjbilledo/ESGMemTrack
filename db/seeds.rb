# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

    Classification.create(classification_name: 'Member')
    Classification.create(classification_name: 'President')

    Event.create(event_name: 'Test Event')
    Event.create(event_name: 'Test Event 2')
    Event.create(event_name: 'Test Event 3')
