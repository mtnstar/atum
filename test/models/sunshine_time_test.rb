# == Schema Information
#
# Table name: sunshine_times
#
#  id               :integer          not null, primary key
#  location_id      :integer          not null
#  date             :date             not null
#  minutes_per_hour :string           not null
#

require 'test_helper'

class SunshineTimeTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
