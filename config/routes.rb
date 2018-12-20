Rails.application.routes.draw do
  namespace 'api' do
    namespace :v1 do
      # Candidates
      post 'pessoas', to: 'candidates#create'

      # Vacancies
      post 'vagas', to: 'vacancies#create'

      # Candidacies
      post 'candidaturas', to: 'candidacies#create'
      get 'vagas/:id/candidaturas/ranking', to: 'candidacies#ranking'
    end
  end
end
