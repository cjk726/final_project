# == Schema Information
#
# Table name: neighborhoods
#
#  id                :integer          not null, primary key
#  neighborhood_name :string
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

class Neighborhood < ApplicationRecord
    has_many :venues
    has_many :pool_tables, :through => :venues, :source => :pool_tables
    has_many :bookmarks, :through => :venues, :source => :bookmarks
    
    validates :neighborhood_name, :presence => true, uniqueness: { case_sensitive: false }
end