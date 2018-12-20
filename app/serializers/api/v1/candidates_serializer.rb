class API::V1::CandidatesSerializer < ActiveModel::Serializer
  attributes :id, :nome, :profissao, :descricao, :localizacao, :nivel

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
