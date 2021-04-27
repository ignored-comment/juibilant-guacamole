require 'rails_helper'

RSpec.describe "Garden's Show Page" do
  before :each do
    @turing_garden = Garden.create!(name: "Turing Community Garden", organic: true)

    @turing_plot1 = @turing_garden.plots.create!(number: 25, size: "Large", direction: "East")
    @turing_plot2 = @turing_garden.plots.create!(number: 15, size: "Medium", direction: "South")

    @cucumber = Plant.create!(name: "Pickling Cucumber", description: "Potential to be nice and salty", days_to_harvest: 100)
    @tomato1 = Plant.create!(name: "Heirloom Tomato", description: "Tom-'ae'-toes, Tom-'ah'-toes", days_to_harvest: 35)
    @tomato2 = Plant.create!(name: "Heirloom Tomato", description: "Tom-'ae'-toes, Tom-'ah'-toes", days_to_harvest: 35)
    @squash = Plant.create!(name: "Squishy Squash", description: "FER THANKSGIBERN", days_to_harvest: 15)
    @peanuts = Plant.create!(name: "G.W Carver's Homebrew Peanuts", description: "So many uses for these", days_to_harvest: 43)

    Harvest.create!(plant: @cucumber, plot: @turing_plot1)
    Harvest.create!(plant: @tomato1, plot: @turing_plot2)
    Harvest.create!(plant: @tomato2, plot: @turing_plot1)
    Harvest.create!(plant: @squash, plot: @turing_plot2)
    Harvest.create!(plant: @peanuts, plot: @turing_plot1)
  end

  describe "as a visitor, when I visit a garden's show page" do
    it "shows me the garden's name and organic attributes, as well as a list of all the plants in that garden's plots" do
      expect(page).to have_content("Turing Community Garden")
      expect(page).to have_content("Organic: true")
      expect(page).to have_content("Heirloom Tomato")
      expect(page).to have_content("Squishy Squash")
      expect(page).to have_content("Heirloom Tomato")
      expect(page).to have_content("G.W Carver's Homebrew Peanuts")

      expect(page).not_to have_content("Pickling Cucumber")
    end
  end
end
