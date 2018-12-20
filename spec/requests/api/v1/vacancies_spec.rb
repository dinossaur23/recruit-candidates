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
        expect(json['empresa']).to eq("Teste")
      end

      it 'returns the status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post vacancies_url, params: { empresa: 'Foobar', titulo: 'Foo', localizacao: 'A'} }

      it 'returns the status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match("{\"description\":[\"can't be blank\"],\"level\":[\"can't be blank\"]}")
      end
    end
  end
end
