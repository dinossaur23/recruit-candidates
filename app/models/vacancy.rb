class Vacancy < ApplicationRecord
  has_many :candidacies
  has_many :candidates, through: :candidacies
  validates :company, :title, :description, :location, :level, presence: true
  validates_format_of :location, with: /\A(A|B|C|D|E|F)\z/, on: :create
  # TODO: level enum
end
