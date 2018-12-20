class API::V1::CandidaciesController < ApplicationController
  before_action only: :create do
    set_vacancy(candidacy_params[:id_vaga])
    set_candidate
  end
  before_action only: :ranking do
     set_vacancy(params[:id])
  end

  # TODO: extract logic to service
  def create
    if @vacancy && @candidate
      candidacy = Candidacy.new(
        vacancy: @vacancy,
        candidate: @candidate,
        score: ScoreCalculator.calculate(
          @candidate.level,
          @vacancy.level,
          @candidate.location,
          @vacancy.location
        )
      )

      if candidacy.save
        head :created
      else
        render json: candidacy.errors, status: :unprocessable_entity
      end
    else
      head :bad_request
    end
  end

  def ranking
    if @vacancy
      candidacies = Candidacy.ranking(@vacancy)
        render json: candidacies, status: :ok
    else
      head :bad_request
    end
  end

   private

  def set_vacancy(vacancy_id)
    @vacancy = Vacancy.find_by(id: vacancy_id)
  end

  def set_candidate
    @candidate = Candidate.find_by(id: candidacy_params[:id_pessoa])
  end

   def candidacy_params
     params.permit(:id_vaga, :id_pessoa)
   end
end
