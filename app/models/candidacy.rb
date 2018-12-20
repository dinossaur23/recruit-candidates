class Candidacy < ApplicationRecord
  belongs_to :vacancy
  belongs_to :candidate

  # TODO: maybe move to scope
  def self.ranking(vacancy)
    Candidacy.joins(:vacancy).where(vacancy: vacancy).order(score: :desc)
  end
end
