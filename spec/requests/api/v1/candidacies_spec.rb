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

  describe 'GET /api/v1/vagas/:id/candidaturas/ranking' do
    context 'when the vacancy exists' do
      before { get "/api/v1/vagas/#{candidacy.vacancy_id}/candidaturas/ranking" }
      let!(:candidacy) { create(:candidacy) }

      it 'returns the ranking' do
        expect(json).not_to be_empty
        expect(json.first['nome']).to eq("Ariel Ha")
        expect(json.first['score']).to eq(92)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the vacancy does not exist' do
      before { get "/api/v1/vagas/#{vacancy_id}/candidaturas/ranking" }
      let!(:vacancy_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(400)
      end
    end
  end
end
