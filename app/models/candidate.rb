class Candidate < ApplicationRecord
  has_many :applications
  has_many :vacancies, through: :applications
end
