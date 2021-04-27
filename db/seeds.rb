# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Harvest.destroy_all
Plant.destroy_all
Plot.destroy_all
Garden.destroy_all

turing_garden = Garden.create!(name: "Turing Community Garden", organic: true)

turing_plot1 = turing_garden.plots.create!(number: 25, size: "Large", direction: "East")
turing_cucumber = turing_plot1.plants.create!(name: "Pickling Cucumber", description: "Potential to be nice and salty", days_to_harvest: 100)

turing_plot2 = turing_garden.plots.create!(number: 15, size: "Medium", direction: "South")
turing_tomato = turing_plot2.plants.create!(name: "Heirloom Tomato", description: "Tom-'ae'-toes, Tom-'ah'-toes", days_to_harvest: 35)


kon_garden = Garden.create!(name: "Garden of Kon", organic: false)
kon_plot1 = kon_garden.plots.create!(number: 5, size: "Small", direction: "North")
kon_garlic = kon_plot1.plants.create!(name: "Rustic Garlic", description: "We ain't kissin' after this!", days_to_harvest: 150)

kon_plot2 = kon_garden.plots.create!(number: 55, size: "Large", direction: "Souf'")
kon_potatoes = kon_plot2.plants.create!(name: "Po-ta-toes", description: "Mash 'em, Boil 'em, Throw 'em in a stew", days_to_harvest: 25)
