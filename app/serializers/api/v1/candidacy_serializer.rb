class API::V1::CandidacySerializer < ActiveModel::Serializer
  attributes :nome, :profissao, :localizacao, :nivel, :score

  def nome
    object.candidate.name
  end

  def profissao
    object.candidate.profession
  end

  def localizacao
    object.candidate.location
  end

  def nivel
    object.candidate.level
  end
end
