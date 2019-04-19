require 'open-uri'
require 'json'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
# db/seeds.rb
Ingredient.destroy_all
Cocktail.destroy_all

url = open('https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list').read
parsed = JSON.parse(url)

parsed['drinks'].each do |hash|
  hash.each do |_k, v|
    Ingredient.new(name: v).save
  end
end

puts parsed
ingredients_attribute = [
  {
    name: 'lemon'
  },
  {
    name: 'ice'
  },
  {
    name: 'mint leaves'
  }
]

cocktails_attribute = [
  {
    name: 'Daiquiri'
  },
  {
    name: 'Fuzzy navel'
  },
  {
    name: 'Long island'
  }
]


Ingredient.create!(ingredients_attribute)
Cocktail.create!(cocktails_attribute)
puts 'finish!'
