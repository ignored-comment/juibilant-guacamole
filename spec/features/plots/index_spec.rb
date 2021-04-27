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
    it 'shows me a list of all plot numbers and beneath each plot number I see all of the names of the plants for that plot' do
      visit '/plots'

      expect(page).to have_content("25")
      expect(page).to have_content("15")
      expect(page).to have_content("Pickling Cucumber")
      expect(page).to have_content("Heirloom Tomato")
    end

    it "has a button to remove a plant from that plot, and when I click the link, I'm returned to the plots index page and I no longer see that plant" do
      visit '/plots'

      within("#plant-#{@turing_cucumber.id}") do
        expect(page).to have_link("Remove this plant")
        click_on("Remove this plant")
      end
      expect(current_path).to eq('/plots')
      expect(page).not_to have_content("Pickling Cucumber")
    end
  end
end
