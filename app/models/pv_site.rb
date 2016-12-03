# == Schema Information
#
# Table name: pv_sites
#
#  id             :integer          not null, primary key
#  location_id    :integer
#  label          :string
#  max_production :integer
#  direction      :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#
#
# TODO add last_forecast_update attr

class PvSite < ApplicationRecord
  belongs_to :user
  belongs_to :location
  has_many :day_forecasts

  # TODO after create, get forecast
end
