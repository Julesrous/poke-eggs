# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require "open-uri"

Pokegg.destroy_all
User.destroy_all

user_1 = User.new(first_name: 'Sacha', last_name: 'Ketchen', gender: 'male', region: 'Kanto', experience: 'very high', email: 'sacha@pokemon.pok', password: 'azerty')
file_user_1 = URI.open('https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQqdtlIVhUz32yqvTTP3MIgQ8iBUoDXu8w99A&usqp=CAU')
user_1.photo.attach(io: file_user_1, filename: 'Sacha.png')
user_1.save
user_2 = User.new(first_name: 'Ondine', last_name: 'Ketchen', gender: 'female', region: 'Kanto', experience: 'very high', email: 'ondine@pokemon.pok', password: 'azerty')
file_user_2 = URI.open('https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTWntqOCkULqZV0xQffLZ4NlnBpLjGGofusLw&usqp=CAU')
user_2.photo.attach(io: file_user_2, filename: 'Ondine.png')
user_2.save
user_3 = User.new(first_name: 'Aurore', last_name: 'Féli-cité', gender: 'female', region: 'Sinnoh', experience: 'good', email: 'aurore@pokemon.pok', password: 'azerty')
file_user_3 = URI.open('https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcRIZFCzTB8taDZZEOFV_x5XqsJPQSC622q6ug&usqp=CAU')
user_3.photo.attach(io: file_user_3, filename: 'Aurore.png')
user_3.save
p "users created"

pokegg_1 = Pokegg.new(name: 'Pikachu', category: 'Electricité', birthday: '10th February 2021', region: 'Kanto', state: 'Very good', price: "1000000")
pokegg_1.user = user_1
file_pokegg_1 = URI.open('https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcQH8Y-MB_sD8lEob2I1C5zze9xM4yLheiWKUQ&usqp=CAU')
pokegg_1.photo.attach(io: file_pokegg_1, filename: 'pikachu.png')
pokegg_1.save
p "poke1 created"

pokegg_2 = Pokegg.new(name: 'Chenipan', category: 'Plante', birthday: '9th December 2020', region: 'Kanto', state: 'Good', price: "100")
pokegg_2.user = user_2
file_pokegg_2 = URI.open('https://images.gameinfo.io/pokemon/256/010-00.png')
pokegg_2.photo.attach(io: file_pokegg_2, filename: 'Chenipan.png')
pokegg_2.save
p "poke1 created"


pokegg_3 = Pokegg.new(name: 'Etourmi', category: 'Vol', birthday: '4th November 2020', region: 'Sinnoh', state: 'Very good', price: "2000")
pokegg_3.user = user_3
file_pokegg_3 = URI.open('https://www.media.pokekalos.fr/img/pokemon/pokego/etourmi.png')
pokegg_3.photo.attach(io: file_pokegg_3, filename: 'Etourmi.png')
pokegg_3.save
p "poke1 created"
