require 'rails_helper'

RSpec.describe "Plots Index Page" do
  before :each do
    @turing_garden = Garden.create!(name: "Turing Community Garden", organic: true)

    @turing_plot1 = @turing_garden.plots.create!(number: 25, size: "Large", direction: "East")
    @turing_cucumber = @turing_plot1.plants.create!(name: "Pickling Cucumber", description: "Potential to be nice and salty", days_to_harvest: 100)

    @turing_plot2 = @turing_garden.plots.create!(number: 15, size: "Medium", direction: "South")
    @turing_tomato = @turing_plot2.plants.create!(name: "Heirloom Tomato", description: "Tom-'ae'-toes, Tom-'ah'-toes", days_to_harvest: 35)
  end
  describe 'as a visitor, when I visit the plots index page' do
    it 'shows me a list of all plot numbers' do
      visit '/plots'

      expect(page).to have_content("25")
      expect(page).to have_content("15")
      expect(page).to have_content("Pickling Cucumber")
      expect(page).to have_content("Heirloom Tomato")
    end
  end
end
