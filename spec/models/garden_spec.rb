require 'rails_helper'

RSpec.describe Garden do
  describe 'relationships' do
    it { should have_many(:plots) }
    it { should have_many(:plants).through(:plots)}
  end

  before :each do
    @turing_garden = Garden.create!(name: "Turing Community Garden", organic: true)

    @turing_plot1 = @turing_garden.plots.create!(number: 25, size: "Large", direction: "East")
    @turing_plot2 = @turing_garden.plots.create!(number: 15, size: "Medium", direction: "South")

    @cucumber = Plant.create!(name: "Pickling Cucumber", description: "Potential to be nice and salty", days_to_harvest: 100)
    @tomato = Plant.create!(name: "Heirloom Tomato", description: "Tom-'ae'-toes, Tom-'ah'-toes", days_to_harvest: 35)
    @squash = Plant.create!(name: "Squishy Squash", description: "FER THANKSGIBERN", days_to_harvest: 15)
    @peanuts = Plant.create!(name: "G.W Carver's Homebrew Peanuts", description: "So many uses for these", days_to_harvest: 43)

    Harvest.create!(plant: @cucumber, plot: @turing_plot1)
    Harvest.create!(plant: @tomato, plot: @turing_plot2)
    Harvest.create!(plant: @tomato, plot: @turing_plot1)
    Harvest.create!(plant: @squash, plot: @turing_plot2)
    Harvest.create!(plant: @peanuts, plot: @turing_plot1)
  end

  describe 'model methods' do
    it "can return a list of all plants included in that garden's plots and I see that this list is unique and only includes plants that take less than 100 days to harvest" do
      expect(@turing_garden.unique_harvest_under_100_days).to eq([@tomato, @squash, @peanuts])
      expect(@turing_garden.unique_harvest_under_100_days).not_to include(@tomato)
      expect(@turing_garden.unique_harvest_under_100_days).not_to include(@cucumber)
    end
  end
end
