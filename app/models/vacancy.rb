class Vacancy < ApplicationRecord
  has_many :applications
  has_many :candidates, through: :applications
end
