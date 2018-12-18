class Candidate < ApplicationRecord
  has_many :candidacies
  has_many :vacancies, through: :candidacies
end
