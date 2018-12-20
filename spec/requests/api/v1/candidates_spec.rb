require 'rails_helper'

RSpec.describe 'Candidates API', type: :request do
  describe 'POST /api/v1/pessoas' do
    let(:candidates_url) { '/api/v1/pessoas' }
    let(:candidate_attributes) do
      {
        nome: 'John Doe',
        profissao: "Engenheiro de Software",
        localizacao: "C",
        nivel: 2
      }
    end

    context 'when the request is valid' do
      before { post candidates_url, params: candidate_attributes }

      it 'creates a candidate' do
        expect(json['name']).to eq('John Doe')
      end

      it 'returns the status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post candidates_url, params: { nome: 'Foobar', localizacao: 'A' } }

      it 'returns the status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match("{\"profession\":[\"can't be blank\"],\"level\":[\"can't be blank\"]}")
      end
    end
  end
end
