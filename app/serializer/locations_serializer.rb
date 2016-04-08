class LocationSerializer < ActiveModel::Serializer
  attributes :name, :country, :region, :lat, :lon, :asl, :timezone
end