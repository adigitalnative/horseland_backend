class PlayerSerializer < ActiveModel::Serializer
  attributes :email, :name
  has_many :horses
end
