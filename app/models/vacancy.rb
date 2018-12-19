class Vacancy < ApplicationRecord
  has_many :candidacies
  has_many :candidates, through: :candidacies
  validates :company, :title, :description, :location, :level, presence: true
end
