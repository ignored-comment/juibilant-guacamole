require 'rails_helper'

RSpec.describe "Garden's Show Page" do
  before :each do
    @turing_garden = Garden.create!(name: "Turing Community Garden", organic: true)

    @turing_plot1 = @turing_garden.plots.create!(number: 25, size: "Large", direction: "East")
    @turing_cucumber = @turing_plot1.plants.create!(name: "Pickling Cucumber", description: "Potential to be nice and salty", days_to_harvest: 100)

    @turing_plot2 = @turing_garden.plots.create!(number: 15, size: "Medium", direction: "South")
    @turing_tomato = @turing_plot2.plants.create!(name: "Heirloom Tomato", description: "Tom-'ae'-toes, Tom-'ah'-toes", days_to_harvest: 35)
  end

  describe "as a visitor, when I visit a garden's show page" do
    it "shows me the garden's name and organic attributes, as well as a list of all the plants in that garden's plots" do
      
    end
  end
end
