require 'rails_helper'

RSpec.describe Candidate, type: :model do
  let(:candidate) do
    described_class.new(
      name: 'name',
      profession: 'ti',
      location: 'D',
      level: 4
    )
  end

  context 'Validations' do
    it 'is valid with valid attributes' do
      expect(candidate).to be_valid
    end

    it 'is not valid without some attribute' do
      candidate.profession = nil
      expect(candidate).to_not be_valid
    end
  end
end
