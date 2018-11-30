# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

jq = Player.find_or_create_by(email: "jq@nativefoundry.com", name: "Jacqueline")
sellingPlayer = Player.find_or_create_by(email: "foo@mail.com", name: "User to sell things")

arabian = Breed.find_or_create_by(name: "Arabian")

masie = Horse.find_or_create_by(name: "Masie", breed: arabian, color: "brown", age: 4, player: jq, gender: "female", image_url: "https://images.pexels.com/photos/614507/pexels-photo-614507.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260")
max = Horse.find_or_create_by(name: "Max", breed: arabian, color: "brown", age: 6, player: jq, gender: "male", image_url: "https://images.pexels.com/photos/1626584/pexels-photo-1626584.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260")


# Build some random seed horses for sale
10.times {FactoryBot.create(:horse, for_sale: true, gender: "female", breed: arabian, player: sellingPlayer)}
10.times {FactoryBot.create(:horse, for_sale: true, gender: "male", breed: arabian, player: sellingPlayer)}
