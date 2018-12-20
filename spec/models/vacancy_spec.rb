require 'rails_helper'

RSpec.describe Vacancy, type: :model do
  let(:vacancy) do
    described_class.new(
      company: "Empresa",
      title: "Vaga RH",
      description: "Para trabalhar em SP.",
      location: 'E',
      level: 2
    )
  end

  context 'Validations' do
    it 'is valid with valid attributes' do
      expect(vacancy).to be_valid
    end

    it 'is not valid without some attribute' do
      vacancy.title = nil
      expect(vacancy).to_not be_valid
    end

    it 'is not valid with invalid location' do
      vacancy.location = "U"
      expect(vacancy).to_not be_valid
    end
  end
end
