class PlaceSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :lat, :lon
  has_many :tags
end
