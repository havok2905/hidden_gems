class PlaceSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :lat, :lon, :street, :city, :zip, :state
  has_many :tags
end
