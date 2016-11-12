# == Schema Information
#
# Table name: locations
#
#  id       :integer          not null, primary key
#  name     :string           not null
#  country  :string           not null
#  region   :string
#  lat      :decimal(10, 6)   not null
#  lon      :decimal(10, 6)   not null
#  asl      :integer          not null
#  timezone :string
#

class LocationSerializer < ActiveModel::Serializer
  attributes :name, :country, :region, :lat, :lon, :asl, :timezone
end
