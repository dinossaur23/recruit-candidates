class API::V1::CandidaciesController < ApplicationController
  before_action :set_vacancy, :set_candidate, only: :create

  def create
    if @vacancy && @candidate
      candidacy = Candidacy.new(vacancy: @vacancy, candidate: @candidate)

      if candidacy.save
        render json: candidacy, status: :created
      else
        render json: candidacy.errors, status: :unprocessable_entity
      end
    else
      head :bad_request
    end
  end

   private

  def set_vacancy
    @vacancy = Vacancy.find_by(id: candidacy_params[:id_vaga])
  end

  def set_candidate
    @candidate = Candidate.find_by(id: candidacy_params[:id_pessoa])
  end

   def candidacy_params
     params.permit(:id_vaga, :id_pessoa)
   end
end
