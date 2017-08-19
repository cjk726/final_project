# == Schema Information
#
# Table name: comfort_zones
#
#  id                    :integer          not null, primary key
#  comfort_zone_name     :string
#  comfort_zone_temp_min :integer
#  created_at            :datetime         not null
#  updated_at            :datetime         not null
#

class ComfortZone < ApplicationRecord
    has_many :outfits
    has_many :users, through: :outfits           # is a :source => :whatever   needed?
    validates :comfort_zone_name, :presence => true, uniqueness: { case_sensitive: false }
    validates :comfort_zone_temp_min, :presence => true, numericality: { only_integer: true }
end
