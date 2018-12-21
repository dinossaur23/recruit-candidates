class API::V1::CandidateSerializer < ActiveModel::Serializer
  attributes :id, :nome, :profissao, :localizacao, :nivel

  def nome
    object.name
  end

  def profissao
    object.profession
  end

  def localizacao
    object.location
  end

  def nivel
    object.level
  end
end
