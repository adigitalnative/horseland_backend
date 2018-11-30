class HorseSerializer < ActiveModel::Serializer
  attributes :id, :name, :breed, :color, :age, :for_sale

  def breed
    object.breed.name
  end
end
