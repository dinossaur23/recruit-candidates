FactoryBot.define do
  factory :candidacy do
    score { 92 }
    association(:vacancy)
    association(:candidate)
  end
end
