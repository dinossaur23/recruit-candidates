class Candidate < ApplicationRecord
  has_many :candidacies
  has_many :vacancies, through: :candidacies
  validates :name, :profession, :location, :level, presence: true
  validates_format_of :location, with: /\A(A|B|C|D|E|F)\z/, on: :create
  # TODO: level enum
end
