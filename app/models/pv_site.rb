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

class PvSite < ApplicationRecord
  belongs_to :user
end
