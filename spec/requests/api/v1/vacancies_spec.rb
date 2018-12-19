require 'rails_helper'

RSpec.describe 'Vacancies API', type: :request do
  describe 'POST /api/v1/vagas' do
    let(:vacancies_url) { '/api/v1/vagas' }
    let(:vacancy_attributes) do
      {
        empresa: "Teste",
        titulo: "Vaga teste",
        descricao: "Criar os mais diferentes tipos de teste",
        localizacao: "A",
        nivel: 3
      }
    end

    context 'when the request is valid' do
      before { post vacancies_url, params: vacancy_attributes }

      it 'creates a candidate' do
        expect(json['company']).to eq("Teste")
      end

      it 'returns the status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post vacancies_url, params: { empresa: 'Foobar', titulo: 'Foo'} }

      it 'returns the status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match("{\"description\":[\"can't be blank\"],\"location\":[\"can't be blank\"],\"level\":[\"can't be blank\"]}")
      end
    end
  end

  # TODO: improve to returns as requested
  describe 'GET /api/v1/vagas/:id' do
    before { get "/api/v1/vagas/#{vacancy_id}" }
    let!(:vacancy_id) { create(:vacancy).id }

    context 'when the record exists' do
      it 'returns the vacancy' do
        expect(json).not_to be_empty
        expect(json['company']).to eq("Teste 2")
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:vacancy_id) { 0 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end
    end
  end
end
