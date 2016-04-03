# == Schema Information
#
# Table name: pv_sites
#
#  id             :integer          not null, primary key
#  label          :string
#  location       :string
#  max_production :integer
#  direction      :integer
#  user_id        :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class PvSite < ApplicationRecord
  belong_to :user
end
