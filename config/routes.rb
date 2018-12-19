Rails.application.routes.draw do
  namespace 'api' do
    namespace :v1 do
      # Candidates
      post 'pessoas', to: 'candidates#create'

      # Vacancies
      post 'vagas', to: 'vacancies#create'
      get 'vagas/:id', to: 'vacancies#show'

      # Candidacies
      post 'candidaturas', to: 'candidacies#create'
    end
  end
end
