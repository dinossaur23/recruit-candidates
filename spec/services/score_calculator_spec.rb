require 'rails_helper'

describe ScoreCalculator do
  describe "#calculate" do
    let(:candidate) { create(:candidate) }
    let(:vacancy) { create(:vacancy) }

    context 'when the level is compatible and candidate is near from vacancy' do
      it 'returns the maximum score' do
        expect(ScoreCalculator.calculate(
          candidate.level,
          vacancy.level,
          candidate.location,
          vacancy.location
        )).to eq(100)
      end
    end

    context 'when the location is far' do
      let(:far_from_a) { "F" }

      it 'returns a minor score' do
        expect(ScoreCalculator.calculate(
          candidate.level,
          vacancy.level,
          far_from_a,
          vacancy.location
        )).to eq(75)
      end
    end
  end

  describe "#shorter_distance_between" do
    context 'given two numbers converted in numbers' do
      let(:candidate_location_number) { 2 } # equivalent to "B"
      let(:vacancy_location_number) { 3 } # equivalent to "C"

      it 'searchs the shorter distance' do
        expect(ScoreCalculator.shorter_distance_between(
          candidate_location_number,
          vacancy_location_number
          )).to eq(7)
      end
    end
  end
end
