# == Schema Information
#
# Table name: locations
#
#  id       :integer          not null, primary key
#  name     :string           not null
#  country  :string           not null
#  region   :string
#  lat      :integer          not null
#  lon      :integer          not null
#  asl      :integer          not null
#  timezone :string           not null
#

require 'test_helper'

class LocationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
