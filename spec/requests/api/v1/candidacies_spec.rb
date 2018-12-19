require 'rails_helper'

RSpec.describe 'Candidacies API', type: :request do
  describe 'POST /api/v1/candidaturas' do
    let(:candidacies_url) { '/api/v1/candidaturas' }
    let(:candidate_id) { create(:candidate).id }
    let(:vacancy_id) { create(:vacancy).id }
    let(:candidacy_attributes) do
      {
        id_pessoa: candidate_id,
        id_vaga: vacancy_id
      }
    end

    context 'when the request is valid' do
      before { post candidacies_url, params: candidacy_attributes }

      it 'creates a candidate' do
        expect(json['vacancy_id']).to eq(vacancy_id)
      end

      it 'returns the status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post candidacies_url, params: { id_pessoa: 'Foobar' } }

      it 'returns the status code 400' do
        expect(response).to have_http_status(400)
      end
    end
  end
end
