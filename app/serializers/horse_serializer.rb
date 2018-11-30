class HorseSerializer < ActiveModel::Serializer
  attributes :id, :name, :breed, :color, :age, :for_sale, :gender, :player_id

  def breed
    object.breed.name
  end
end
