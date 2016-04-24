class PlaceSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :lat, :lon, :street, :city, :zip, :state, :cover, :website
  has_many :tags
end
