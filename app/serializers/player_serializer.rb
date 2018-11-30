class PlayerSerializer < ActiveModel::Serializer
  attributes :id, :email, :name, :available_horses
  has_many :horses
end
