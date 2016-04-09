# == Schema Information
#
# Table name: locations
#
#  id       :integer          not null, primary key
#  name     :string           not null
#  country  :string           not null
#  region   :string           not null
#  lat      :integer          not null
#  lon      :integer          not null
#  asl      :integer          not null
#  timezone :string           not null
#

class Location < ApplicationRecord
  include ActiveModel::Serializers::JSON
  has_many :sunshine_times
end
