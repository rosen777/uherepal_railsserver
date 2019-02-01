# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
u1 = User.create(email: "test@test.com", password: "test")
u2 = User.create(email: "two@test.com", password: "test")
u3 = User.create(email: "three@test.com", password: "test")


e1 = Event.create(title: "TestEvent", user_id: 1, longitude: 51.456, latitude: 11.146, icon: "hi not here", capacity: 5, datetime: DateTime.now )

UserEvent.create(user_id: 2, event_id: 1)
UserEvent.create(user_id: 3, event_id: 1)
