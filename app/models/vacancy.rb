class Vacancy < ApplicationRecord
  has_many :candidacies
  has_many :candidates, through: :candidacies
end
