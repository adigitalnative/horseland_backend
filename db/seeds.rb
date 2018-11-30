# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

jq = Player.find_or_create_by(email: "jq@nativefoundry.com", name: "Jacqueline")

arabian = Breed.find_or_create_by(name: "Arabian")

masie = Horse.find_or_create_by(name: "Masie", breed: arabian, color: "Brown", age: 4, player: jq, gender: "female")
max = Horse.find_or_create_by(name: "Max", breed: arabian, color: "Brown", age: 6, player: jq, gender: "male")
