class API::V1::VacanciesController < ApplicationController
    before_action :set_vacancy, only: :show

  def create
    vacancy = Vacancy.new(
      company: vacancy_params[:empresa],
      title: vacancy_params[:titulo],
      description: vacancy_params[:descricao],
      location: vacancy_params[:localizacao],
      level: vacancy_params[:nivel]
    )

    if vacancy.save
      render json: vacancy, status: :created
    else
      render json: vacancy.errors, status: :unprocessable_entity
    end
  end

   private

   def set_vacancy
     @vacancy = Vacancy.find_by(id: params[:id])
  end

   def vacancy_params
     params.permit(:empresa, :titulo, :descricao, :localizacao, :nivel)
   end
end
