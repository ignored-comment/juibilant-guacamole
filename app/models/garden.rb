class Garden < ApplicationRecord
  has_many :plots
  has_many :plants, through: :plots

  def unique_harvest_under_100_days
    plants.distinct.where('days_to_harvest < ?', 100)
  end
end
