class API::V1::CandidatesController < ApplicationController

  def create
    candidate = Candidate.new(
      name: candidate_params[:nome],
      profession: candidate_params[:profissao],
      location: candidate_params[:localizacao],
      level: candidate_params[:nivel]
    )

    if candidate.save
      render json: candidate, status: :created
    else
      render json: candidate.errors, status: :unprocessable_entity
    end
  end

   private

   def candidate_params
     params.permit(:nome, :profissao, :localizacao, :nivel)
   end
end
